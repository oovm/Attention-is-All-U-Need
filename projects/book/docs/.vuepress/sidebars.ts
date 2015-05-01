import {SidebarConfig} from "vuepress";

export const sidebar_cn: SidebarConfig = {
    'cn': [
        {
            text: 'π 家族',
            collapsible: true,
            children: [
                {
                    text: "4k + i 型逼近",
                    link: "/cn/π-family/4k+i.md",
                },
                {
                    text: "十进制逼近",
                    link: "/cn/literal/approx10.md",
                },
                {
                    text: "最佳逼近",
                    link: "/cn/literal/approx-best.md",
                },
            ]
        },
        {
            text: 'e 家族',
            collapsible: true,
            children: [
                {
                    text: "十进制逼近",
                    link: `/cn/e-family/approx10.md`,
                },
                {
                    text: "最佳逼近",
                    link: `/cn/e-family/approx10-best.md`,
                },
            ]
        },
        {
            text: '附录',
            collapsible: false,
            children: []
        }
    ]
}
