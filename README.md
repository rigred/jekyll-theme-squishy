# Squishy – A Jekyll Theme

**Squishy** is a clean, dark, and responsive Jekyll theme designed for technical blogs, articles, and project documentation. It prioritizes readability and provides a great experience for code-heavy content.

---

## ✨ Features

- **Minimalist Dark Mode**: A beautiful, eye-friendly dark theme that makes content pop.  
- **Responsive Design**: Looks great on desktops, tablets, and mobile devices.  
- **Sticky Table of Contents**: For posts with a TOC enabled, a sidebar automatically appears on large screens and stays pinned as the user scrolls.  
- **Syntax Highlighting**: Clean and clear styling for code blocks.  
- **Configurable**: Easily customize settings through Jekyll’s `_config.yml`.

---

## 🚀 Installation

You can install the Squishy theme as a Ruby gem.

1. Add this line to your Jekyll site's `Gemfile`:

   ```ruby
   gem "jekyll-theme-squishy"
   ```

2. Add this line to your `_config.yml`:

   ```yaml
   theme: jekyll-theme-squishy
   ```

3. Install the required `jekyll-toc` plugin for the Table of Contents:

   Add this to your `Gemfile`:

   ```ruby
   gem "jekyll-toc"
   ```

   Then add it to your `_config.yml`:

   ```yaml
   plugins:
     - jekyll-toc
     - jekyll-feed
   ```

4. Finally, run:

   ```bash
   bundle install
   ```

---

## 🧭 Usage

### Enabling the Table of Contents

To enable the sticky TOC for a specific post, include the following in the post's front matter:

```yaml
---
layout: post
title: "Your Awesome Post Title"
toc: true
toc_label: "In This Article" # Title above the TOC
---
```

> **Note:** The TOC only appears on screens wider than 1200px.

---

## 🎨 Customization

You can override any of the theme’s default files by creating a file with the same name in your project directory.
For example, to customize the core styles:

```bash
your-site/
├── _sass/
│   └── squishy.scss
```

---

## 🤝 Contributing

Bug reports and pull requests are welcome on GitHub at:
[https://github.com/your-username/jekyll-theme-squishy](https://github.com/your-username/jekyll-theme-squishy)

---

## 📄 License

This theme is open source and available under the [MIT License](LICENSE).

