package cn.colg;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;

import lombok.extern.slf4j.Slf4j;

/**
 * Mapper 测试基类
 *
 * @author colg
 */
@Slf4j
public abstract class BaseMapperTest {

    /** 获取sqlSsession工厂 */
    private static SqlSessionFactory sqlSessionFactory;
    /** 获取sqlSession实例，提供给子类 */
    protected SqlSession sqlSession;

    /**
     * 从 XML 中构建SqlSessionFactory
     *
     * @throws Exception
     */
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    /**
     * 从SqlsessionFactory 中获取 sqlSession
     *
     * @throws Exception
     */
    @Before
    public void setUp() throws Exception {
        sqlSession = sqlSessionFactory.openSession();
    }

    /**
     * 销毁sqlSession
     *
     * @throws Exception
     */
    @After
    public void tearDown() throws Exception {
        sqlSession.close();
        log.info("BaseMapperTest.tearDown() : {}", "----------------------------------------------------------------------------------------------------\n");
    }
}
