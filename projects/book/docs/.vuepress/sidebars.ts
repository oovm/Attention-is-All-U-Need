import {SidebarConfig} from "vuepress";

export const sidebar_cn: SidebarConfig = [
    {
        text: 'π 家族',
        collapsible: false,
        children: [
            {
                text: "4k + i 型逼近",
                link: "/cn/π-family/4k+i.md",
            },
            {
                text: "十进制逼近",
                link: "/cn/π-family/approx10.md",
            },
            {
                text: "最佳逼近",
                link: "/cn/π-family/approx-best.md",
            },
            {
                text: "拉马努金级数",
                link: "/cn/π-family/reciprocal.md",
            },
        ]
    },
    {
        text: 'e 家族',
        collapsible: false,
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
