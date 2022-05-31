package org.opengauss.sqltranslator;

import com.alibaba.druid.DbType;
import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.ast.SQLStatement;
import org.opengauss.sqltranslator.dialect.mysql.MySqlToOpenGaussOutputVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class ExecuteTranslate {

    private static final Logger logger = LoggerFactory.getLogger(ExecuteTranslate.class);

    public static void main(String[] args) {
        try {
            System.out.println(translateMysql2openGauss(args[0], false));
        } catch (Exception e) {
            logger.error(e.getLocalizedMessage());
        }
    }

    public static String translateMysql2openGauss(String Sql_in,boolean debug) {
        final StringBuilder appender = new StringBuilder();
        final MySqlToOpenGaussOutputVisitor visitor = new MySqlToOpenGaussOutputVisitor(appender);

        final List<SQLStatement> sqlStatements = SQLUtils.parseStatements(Sql_in, DbType.mysql);

        final StringBuilder res = new StringBuilder();

        for (SQLStatement statement : sqlStatements) {
            statement.accept(visitor);
            visitor.println();
            if(debug){
                System.out.println(appender.toString());
            }else{
                res.append(appender.toString());
            }
            appender.delete(0,appender.length());
        }

        return res.toString();
    }

}
