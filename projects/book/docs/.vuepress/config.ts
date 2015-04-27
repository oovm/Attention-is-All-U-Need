import {SidebarConfig, SiteLocaleConfig} from "vuepress";
import {SidebarConfigArray} from "@vuepress/theme-default/lib/shared/nav";

import {defineUserConfig, defaultTheme} from 'vuepress'
import {shikiPlugin} from "@vuepress/plugin-shiki";
import {IGrammar} from "vscode-textmate";
import * as path from "path";


const locales: SiteLocaleConfig = {
    '/cn/': {
        lang: 'zh-CN',
        title: '注意力训练手册',
    },
    '/en/': {
        lang: 'en-US',
        title: 'Valkyrie Tutorial',
    }
};

function build_sidebar(lang: string): SidebarConfigArray {
    return [
        {
            text: 'π 家族',
            collapsible: true,
            children: [
                {
                    text: "4k + i 型逼近",
                    link: `/${lang}/π-family/4k+i.md`,
                },
                {
                    text: "Number Literal",
                    link: "/en/literal/number.md",
                },
                {
                    text: "String Formatted",
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
            collapsible: false,
            children: []
        },
        {
            text: 'Appendix',
            collapsible: false,
            children: []
        }
    ]
}

const theme = defaultTheme(
    {
        repo: 'nyar-lang/valkyrie-language',
        colorModeSwitch: true,
        docsBranch: "dev",
        editLink: true,
        docsDir: 'docs',
        lastUpdated: true,
        locales: {
            '/cn/': {
                selectLanguageText: '选择语言',
                selectLanguageName: "简体中文",
                editLinkText: '在 GitHub 上编辑此页',
                sidebar: {
                    "/cn/": build_sidebar("cn"),
                },
            },
            '/en/': {
                selectLanguageText: 'Languages',
                selectLanguageName: 'English',
                editLinkText: 'Edit this page on GitHub',
                sidebar: {
                    "/en/": build_sidebar("en"),
                },
                navbar: []
            },
        },
    }
)


export default defineUserConfig({
    dest: 'docs/.build',
    lang: 'en-US',
    title: 'Valkyrie Tutorial',
    description: 'A multi-stage gradual typed language',
    locales: locales,
    head: [
        ['link', {rel: 'shortcut icon', type: "image/x-icon", href: './favicon.png'}]
    ],
    theme: theme,
    // serviceWorker: true,
    markdown: {
        toc: {}

        // config: md => {
        //
        // }
    },
    plugins: [
        shikiPlugin({
            theme: "one-dark-pro",
            langs: [
                "hs",
                "typescript",
                "python",
                "rust",
                "yaml",
                {
                    id: "Valkyrie",
                    scopeName: "source.vk",
                    aliases: ["vk", "valkyrie"],
                    // samplePath? : string;
                    // embeddedLangs? : Lang[];
                    // balancedBracketSelectors? : string[];
                    // unbalancedBracketSelectors? : string[];
                    path: path.resolve("./docs/.vuepress/styles/valkyrie.tmLanguage.json"),
                    // grammar? : IGrammar;
                }
            ]
        }),
    ],
})
