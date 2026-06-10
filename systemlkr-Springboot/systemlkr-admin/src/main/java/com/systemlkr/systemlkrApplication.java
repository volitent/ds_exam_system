package com.systemlkr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author systemlkr
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class systemlkrApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(systemlkrApplication.class, args);
        System.out.println("项目启动成功！   (‾◡◝)  \n" +
                " ███████╗██╗   ██╗ ██████╗ ██████╗███████╗███████╗███████╗    ██╗         ██╗ ███╗      ███╗ ██╗  \n" +
                " ██╔════╝██║   ██║██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝    ██║        ██╔╝██╔██╗    ██╔██╗╚██╗ \n" +
                " ███████╗██║   ██║██║     ██║     █████╗  ███████╗███████╗    ██║        ██║ ╚═╝╚═╝    ╚═╝╚═╝ ██║ \n" +
                " ╚════██║██║   ██║██║     ██║     ██╔══╝  ╚════██║╚════██║    ╚═╝        ██║                  ██║ \n" +
                " ███████║╚██████╔╝╚██████╗╚██████╗███████╗███████║███████║    ██╗        ╚██╗                ██╔╝ \n" +
                " ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝    ╚═╝         ╚═╝                ╚═╝  \n");
    }
}
