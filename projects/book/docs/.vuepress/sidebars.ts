import {SidebarConfig} from "vuepress";

export const sidebar_cn: SidebarConfig = {
    'cn': [
        {
            text: 'π 家族',
            collapsible: true,
            children: [
                {
                    text: "4k + i 型逼近",
                    link: `/cn/π-family/4k+i.md`,
                },
                {
                    text: "十进制逼近",
                    link: "/en/literal/number.md",
                },
                {
                    text: "最佳逼近",
                    link: "/en/literal/string.md",
                },
                {
                    text: "String Templated",
                    link: "/en/literal/template.md",
                },
            ]
        },
        {
            text: 'e 家族',
            collapsible: true,
            children: [
                {
                    text: "十进制逼近",
                    link: `/cn/e-family/e-approx10.md`,
                },
                {
                    text: "最佳逼近",
                    link: `/cn/e-family/e-approx10.md`,
                },
            ]
        },
        {
            text: 'Appendix',
            collapsible: false,
            children: []
        }
    ]
}
