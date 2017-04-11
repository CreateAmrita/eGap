package egov
import groovy.sql.Sql

class EgovSqlQueryService {

    def newSQLInstance() {
		def db = [url: 'jdbc:mysql://localhost/cce_egov?zeroDateTimeBehavior=convertToNull',
				  user: 'root', password: '@mm@123', driver: 'com.mysql.jdbc.Driver']
		def sql = Sql.newInstance(db.url, db.user, db.password, db.driver)
		return sql
    }
	
	def closeSQLInstance(Sql sql){
		sql.close()
	}
	
	def testQuery(School school, Role role) {
		def sql = newSQLInstance()
//		sql.eachRow("""SELECT * FROM User WHERE school_id =?1.id""",[school], { user ->
//			println user.id
//		})
//		sql.eachRow("""select 
//								u.id, ur.role_id
//							from 
//								user u, user_role ur 
//							where 
//								ur.user_id=u.id and 
//								u.school_id=?1.id and 
//								ur.role_id =?2.id
//					"""
//				,[school, role], { result -> println result })
		sql.eachRow("""select 
						a.user_id
					from
						(select
								u.id user_id, ur.role_id role_id
							from 
								user u, user_role ur 
							where 
								ur.user_id=u.id and 
								u.school_id=?1.id and 
								ur.role_id =?2.id
						) as a
					"""
					,[school, role], { result -> println result })
		closeSQLInstance(sql)
	}
	//for faculty profile page 
	def rCurrAcYrTeacherSubMarkEntryStatus(AcademicYear acYr, School school, User teacher){
		def sql = newSQLInstance()
		def ret=[:], ik=1, termcount=0
		def terms = AcademicTerms.findAllByAcademicYear(acYr)
		//fetching markentry status of teacher class subjects formative
		sql.eachRow("""select 
							class_master_id, class_name, schl_cls_div_id, division, subject_master_id, subject_name, term_id, term, round(sum(percentScore)/count(assessment_type)) percentScore 	
						from (
							select 
								class_master_id, class_name, schl_cls_div_id, division, assessment_type, subject_master_id, subject_name, term_id, term, round(sum(percentScore)/count(student_id)) percentScore 	
							from (
								select 
									student_id, class_master_id, class_name, schl_cls_div_id, division, assessment_type, subject_master_id, subject_name, term_id, term, round(sum(mark_obtained)/count(*)) percentScore 
								from (
									select 
										 t.subject_master_id subject_master_id, sm.subject subject_name, t.class_master_id class_master_id, cm.class_name class_name, t.schl_cls_div_id schl_cls_div_id, scd.division division, atr.id term_id, atr.term term, scr.student_id student_id, sa.id, asType.id assessment_type, count(*) howManyActs,(count(ssas.marks_obtained)/count(saacr.id))*100 mark_obtained
									from 
										teacher_subject_assign t, subject_master sm, user u, school_class_division scd, school_subject_rel ssr, student_class_rel scr, class_master cm, assessment_types asType,assessments a, academic_terms atr, school_assessments sa, schl_asmnt_activity_cls_rel saacr, std_schol_activity_score ssas
									where 
										t.teacher_id= ?1.id and 
										t.school_id= ?2.id and 
										t.academic_year_id=?3.id and
										scd.id = t.schl_cls_div_id and 
										scd.school_class_rel_id = ssr.schl_cls_rel_id and
										t.subject_master_id = ssr.subj_master_id and
										sm.id = ssr.subj_master_id and
										cm.id = t.class_master_id and
										scr.academic_year_id = 	t.academic_year_id and
										scr.school_id = t.school_id and 
										scr.class_master_id = t.class_master_id and
										scr.class_div_id = t.schl_cls_div_id and
										(ssr.sub_type = "Compulsory" or ssr.sub_type = "Language I" ) and
										#scr.student_id in (select student_id from student_class_rel where academic_year_id = t.academic_year_id and school_id = t.school_id and class_master_id = t.class_master_id and class_div_id = t.schl_cls_div_id) and
										a.class_master_id= t.class_master_id and
										a.subject_id = t.subject_master_id and
										a.academic_year_id = t.academic_year_id and
										atr.academic_year_id = t.academic_year_id and
										a.academic_term_id = atr.id and
										asType.id = 1 and 
										a.assessment_type_id= asType.id and
										sa.assessment_id= a.id and
										sa.class_master_id = t.class_master_id and
										sa.school_id = t.school_id and
										saacr.school_assessment_id = sa.id and
										t.teacher_id = u.id and
										saacr.created_by = u.username and
										ssas.academic_year_id=t.academic_year_id and
										ssas.assmnt_activity_class_rel_id = saacr.id and
										ssas.class_master_id = t.class_master_id and
										ssas.division_id = t.schl_cls_div_id and
										ssas.school_id = t.school_id and
										ssas.student_id = scr.student_id and
										(ssas.marks_obtained<>0 or ssas.marks_obtained IS NOT NULL)
										group by scr.student_id, sa.id
									) 
								t group by student_id, subject_master_id, term_id, class_master_id, schl_cls_div_id
							)g group by subject_master_id, term_id, class_master_id, schl_cls_div_id
							UNION
							select 
								class_master_id, class_name, schl_cls_div_id, division, assessment_type, subject_master_id, subject_name, term_id, term, round(sum(percentScore)/count(student_id)) percentScore 	
							from (
								select 
									student_id, class_master_id, class_name, schl_cls_div_id, division, assessment_type, subject_master_id, subject_name, term_id, term, round(sum(mark_obtained)/count(*)) percentScore 
								from (
									select 
										 t.subject_master_id subject_master_id, sm.subject subject_name, t.class_master_id class_master_id, cm.class_name class_name, t.schl_cls_div_id schl_cls_div_id, scd.division division, atr.id term_id, atr.term term, sos.student_id student_id, sa.id, asType.id assessment_type, count(*) howManyActs,(count(ssas.marks_obtained)/count(saacr.id))*100 mark_obtained
									from 
										teacher_subject_assign t, subject_master sm, user u,class_master cm, school_class_division scd, school_subject_rel ssr, student_optional_subject sos, assessment_types asType,assessments a, academic_terms atr, school_assessments sa, schl_asmnt_activity_cls_rel saacr, std_schol_activity_score ssas
									where 
										t.teacher_id= ?1.id and 
										t.school_id= ?2.id and 
										t.academic_year_id=?3.id and
										cm.id = t.class_master_id and
										scd.id = t.schl_cls_div_id and 
										scd.school_class_rel_id = ssr.schl_cls_rel_id and
										t.subject_master_id = ssr.subj_master_id and
										sm.id = ssr.subj_master_id and
										sos.academic_year_id = 	t.academic_year_id and
										sos.school_id = t.school_id and 
										sos.school_class_id = scd.school_class_rel_id and
										(ssr.sub_type = "Additional" or ssr.sub_type = "Language II" ) and
										a.class_master_id= t.class_master_id and
										a.subject_id = t.subject_master_id and
										a.academic_year_id = t.academic_year_id and
										atr.academic_year_id = t.academic_year_id and
										a.academic_term_id = atr.id and
										asType.id = 1 and 
										a.assessment_type_id= asType.id and
										sa.assessment_id= a.id and
										sa.class_master_id = t.class_master_id and
										sa.school_id = t.school_id and
										saacr.school_assessment_id = sa.id and
										t.teacher_id = u.id and
										saacr.created_by = u.username and
										ssas.academic_year_id=t.academic_year_id and
										ssas.assmnt_activity_class_rel_id = saacr.id and
										ssas.class_master_id = t.class_master_id and
										ssas.division_id = t.schl_cls_div_id and
										ssas.school_id = t.school_id and
										ssas.student_id = sos.student_id and
										(ssas.marks_obtained<>0 or ssas.marks_obtained IS NOT NULL)
										group by sos.student_id, sa.id
									) 
								t group by student_id, subject_master_id, term_id, class_master_id, schl_cls_div_id
							)g group by subject_master_id, term_id, class_master_id, schl_cls_div_id
							UNION
							select 
								class_master_id, class_name, schl_cls_div_id, division, assessment_type, subject_master_id, subject_name, term_id, term, round(sum(percentScore)/count(student_id)) percentScore 
							from (
									select 
										 t.subject_master_id subject_master_id, sm.subject subject_name, t.class_master_id class_master_id, cm.class_name class_name, t.schl_cls_div_id schl_cls_div_id, scd.division division, atr.id term_id, atr.term term, scr.student_id student_id, sa.id, asType.id assessment_type, count(*) howManyActs, (count(sss.marks_obtained)/count(sss.id))*100 percentScore
									from
										teacher_subject_assign t, subject_master sm, school_class_division scd, school_subject_rel ssr, student_class_rel scr, class_master cm, assessment_types asType,assessments a, academic_terms atr, summative_assessments sa, student_sa_score sss
									where 
										t.teacher_id= ?1.id and 
										t.school_id= ?2.id and 
										t.academic_year_id=?3.id and
										scd.id = t.schl_cls_div_id and 
										scd.school_class_rel_id = ssr.schl_cls_rel_id and
										t.subject_master_id = ssr.subj_master_id and
										sm.id = ssr.subj_master_id and
										cm.id = t.class_master_id and
										scr.academic_year_id = 	t.academic_year_id and
										scr.school_id = t.school_id and 
										scr.class_master_id = t.class_master_id and
										scr.class_div_id = t.schl_cls_div_id and
										(ssr.sub_type = "Compulsory" or ssr.sub_type = "Language I" ) and
										a.class_master_id= t.class_master_id and
										a.subject_id = t.subject_master_id and
										a.academic_year_id = t.academic_year_id and
										atr.academic_year_id = t.academic_year_id and
										a.academic_term_id = atr.id and
										asType.id = 2 and 
										a.assessment_type_id= asType.id and
										sa.assessment_id= a.id and
										sa.class_master_id = t.class_master_id and
										(sa.school_id=0 or sa.school_id = t.school_id) and
										sa.status = 'Active' and
										sss.summative_assessment_id=sa.id and
										sss.school_id=t.school_id and
										sss.student_id = scr.student_id and
										(sss.marks_obtained<>0 or sss.marks_obtained IS NOT NULL)
										group by scr.student_id, sa.id
							)g group by subject_master_id, term_id, class_master_id, schl_cls_div_id
							UNION
							select 
								class_master_id, class_name, schl_cls_div_id, division, assessment_type, subject_master_id, subject_name, term_id, term, round(sum(percentScore)/count(student_id)) percentScore 	
							from (
									select 
										 t.subject_master_id subject_master_id, sm.subject subject_name, t.class_master_id class_master_id, cm.class_name class_name, t.schl_cls_div_id schl_cls_div_id, scd.division division, atr.id term_id, atr.term term, sos.student_id student_id, sa.id, asType.id assessment_type, count(*) howManyActs,(count(sss.marks_obtained)/count(sss.id))*100 percentScore
									from 
										teacher_subject_assign t, subject_master sm,class_master cm, school_class_division scd, school_subject_rel ssr, student_optional_subject sos, assessment_types asType,assessments a, academic_terms atr, summative_assessments sa, student_sa_score sss
									where 
										t.teacher_id= ?1.id and 
										t.school_id= ?2.id and 
										t.academic_year_id=?3.id and
										cm.id = t.class_master_id and
										scd.id = t.schl_cls_div_id and 
										scd.school_class_rel_id = ssr.schl_cls_rel_id and
										t.subject_master_id = ssr.subj_master_id and
										sm.id = ssr.subj_master_id and
										sos.academic_year_id = 	t.academic_year_id and
										sos.school_id = t.school_id and 
										sos.school_class_id = scd.school_class_rel_id and
										(ssr.sub_type = "Additional" or ssr.sub_type = "Language II" ) and
										a.class_master_id= t.class_master_id and
										a.subject_id = t.subject_master_id and
										a.academic_year_id = t.academic_year_id and
										atr.academic_year_id = t.academic_year_id and
										a.academic_term_id = atr.id and
										asType.id = 2 and 
										a.assessment_type_id= asType.id and
										sa.assessment_id= a.id and
										sa.class_master_id = t.class_master_id and
										(sa.school_id=0 or sa.school_id = t.school_id) and
										sa.status = 'Active' and
										sss.summative_assessment_id=sa.id and
										sss.school_id=t.school_id and
										sss.student_id = sos.student_id and
										(sss.marks_obtained<>0 or sss.marks_obtained IS NOT NULL)
										group by sos.student_id, sa.id
							)g group by subject_master_id, term_id, class_master_id, schl_cls_div_id
						) h group by subject_master_id, term_id, class_master_id, schl_cls_div_id"""
		,[teacher, school, acYr], 
		{ result -> 
			//println result
			if(!ret."Subject$ik")
				ret."Subject$ik" = [SubjectId:result.subject_master_id, SubjectName:result.subject_name, className: result.class_name, division: result.division, "Term1":0, "Term2":0]
			if(result.term.toString()=="Term 1")
				ret."Subject$ik"."Term1"=result.percentScore
			else if(result.term.toString()=="Term 2")
				ret."Subject$ik"."Term2"=result.percentScore
			termcount += 1
			if(termcount==2){
				ik+=1
				termcount=0
			}
		})
		ret."totSubjects"= ik-1
		ret."SchoolId" = school?.id
		ret."TeacherId"=teacher?.id
		closeSQLInstance(sql)
		return ret
	}
}
