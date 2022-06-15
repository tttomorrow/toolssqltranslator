package org.opengauss.sqltranslator;

import com.alibaba.druid.DbType;
import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.ast.SQLStatement;
import org.opengauss.sqltranslator.dialect.mysql.MySqlToOpenGaussOutputVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;

public class ExecuteTranslate {

    private static final Logger logger = LoggerFactory.getLogger(ExecuteTranslate.class);

    public static void main(String[] args) {
        String raw_sql = "";
        // if the encoded sql is passed in through the --base64 parameter, the sql needs
        // to be decoded
        if (args.length == 2 && args[0].equals("--base64")) {
            // decode sql
            byte[] decode = Base64.getDecoder().decode(args[1]);
            try {
                raw_sql = new String(decode, "utf-8");
            } catch (UnsupportedEncodingException e) {
                logger.error(e.getLocalizedMessage());
            }
        } else {
            raw_sql = args[0];
        }
        try {
            System.out.println(translateMysql2openGauss(raw_sql, false));
        } catch (Exception e) {
            logger.error(e.getLocalizedMessage());
        }
    }

    public static String translateMysql2openGauss(String Sql_in, boolean debug) {
        final StringBuilder appender = new StringBuilder();
        final MySqlToOpenGaussOutputVisitor visitor = new MySqlToOpenGaussOutputVisitor(appender);

        final List<SQLStatement> sqlStatements = SQLUtils.parseStatements(Sql_in, DbType.mysql);

        final StringBuilder res = new StringBuilder();

        for (SQLStatement statement : sqlStatements) {
            statement.accept(visitor);
            visitor.println();
            if (debug) {
                System.out.println(appender.toString());
            } else {
                res.append(appender.toString());
            }
            appender.delete(0, appender.length());
        }

        return res.toString();
    }

}
