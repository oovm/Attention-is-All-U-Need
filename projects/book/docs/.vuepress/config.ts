import { defaultTheme, defineUserConfig, SiteLocaleConfig } from "vuepress";
import { shikiPlugin } from "@vuepress/plugin-shiki";
import * as path from "path";
import { sidebar_cn } from "./sidebars";

import mathjax3 from 'markdown-it-mathjax3';


const locales: SiteLocaleConfig = {
    '/cn/': {
        lang: 'zh-CN',
        title: '拉马努金习题册',
    },
    '/en/': {
        lang: 'en-US',
        title: 'Valkyrie Tutorial',
    }
};

const theme = defaultTheme(
    {
        repo: 'oovm/Attention-is-All-U-Need',
        colorModeSwitch: true,
        docsBranch: "dev",
        editLink: true,
        docsDir: 'projects/book/docs',
        lastUpdated: true,
        locales: {
            '/cn/': {
                selectLanguageText: '选择语言',
                selectLanguageName: "简体中文",
                editLinkText: '在 GitHub 上编辑此页',
                sidebar: sidebar_cn,
            },
            '/en/': {
                selectLanguageText: 'Languages',
                selectLanguageName: 'English',
                editLinkText: 'Edit this page on GitHub',
                sidebar: sidebar_cn,
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
        ['link', { rel: 'shortcut icon', type: "image/x-icon", href: './favicon.png' }]
    ],
    theme: theme,
    // serviceWorker: true,
    markdown: {
        toc: {}

        // config: md => {
        //
        // }
    },
    extendsMarkdown: md => {
        md.use(mathjax3)
        md.linkify.set({ fuzzyEmail: false })
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
                "wolfram",
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
