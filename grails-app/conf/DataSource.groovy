dataSource {
	pooled = true
	driverClassName="com.mysql.jdbc.Driver"
	dialect = org.hibernate.dialect.MySQL5InnoDBDialect
	username = "root"
	password = "@mm@123"
}
hibernate {
	cache.use_second_level_cache = true
	//cache.use_query_cache = false
	cache.use_query_cache=true
	cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
		/*
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://192.168.171.220:3306/cce_egov?zeroDateTimeBehavior=convertToNull&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8"
			username = "root"
			password = "@mm@123"
			properties {
				maxActive = 50
				maxIdle = 25
				minIdle = 5
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
            }
		}
		*/
      dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			username="root"
			password="@mm@123"
//			url = "jdbc:mysql://192.168.171.92:3306/egov"
			url = "jdbc:mysql://localhost/cce_egov?zeroDateTimeBehavior=convertToNull"
        }
    }
    test {
       dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
		/*
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://192.168.171.220:3306/cce_egov?zeroDateTimeBehavior=convertToNull&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8"
			driverClassName="com.mysql.jdbc.Driver"
			username = "root"
			password = "@mm@123"
		}
		*/
    }
    production {
        dataSource {
            dbCreate = "update"
			jndiName = "java:comp/env/MySqlGrailsDSCCE"
			properties {
             maxActive = 50
				maxIdle = 25
				minIdle = 5
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
            }
        }
    }
}
