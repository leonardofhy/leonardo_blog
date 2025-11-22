# Bilingual Feature Guide

I have enabled bilingual support (English & Traditional Chinese) for your blog.

## 1. Configuration
- **Default Language**: English (`en`)
- **Second Language**: Traditional Chinese (`zh-tw`)
- **Names**:
    - English: Leonardo Foo Haw Yang
    - Chinese: 胡皓雍

## 2. How to Create Bilingual Content
To create a post available in both languages, you need two files with the same filename but different extensions:

1.  **English (Default)**: `content/posts/my-post.md`
2.  **Chinese**: `content/posts/my-post.zh-tw.md`

**Important**: Ensure the `title` and `date` in the front matter match (or are close) so Hugo knows they are translations of the same content. Hugo matches them based on the filename (everything before the first dot).

## 3. Switching Languages
- A language switcher will appear in the top navigation bar (e.g., "English | 繁體中文").
- If a specific page has a translation, clicking the switcher will take you to that translation.
- If a page **does not** have a translation, the switcher might take you to the homepage of that language (depending on the theme behavior).

## 4. Existing Content
- All your existing `.md` files are treated as English content.
- To translate them, simply create a copy with `.zh-tw.md` extension and translate the text.
