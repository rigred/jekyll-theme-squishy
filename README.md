# Squishy – A Jekyll Theme

**Squishy** is a clean, dark, and responsive Jekyll theme designed for technical blogs and project documentation. It focuses on readability, performance, and presenting code-heavy content in a clear, single-column layout.

-----

## ✨ Features

- **Minimalist Dark Mode**: A beautiful, eye-friendly dark theme that makes content pop.
- **Responsive Single-Column Layout**: The content-focused design looks great on desktops, tablets, and mobile devices.
- **Automatic Image Captions**: Simply use a standard Markdown image with `alt` text, and the theme will automatically generate a clean, centered caption below it.
- **Built-in TOC**: Easily add a Table of Contents to any post.
- **Optimized for Performance**: Comes with simple CSS styling by default to ensure fast load times. No JS loading, and it tries to fit most pages into the 15KB TCP slow start window.
- **Syntax Highlighting**: Clean and clear styling for code blocks.

-----

## 🚀 Installation & Setup

You can install Squishy as a theme gem, but it requires a few extra steps to enable all features.

### Step 1: Add the Theme and Plugins to `Gemfile`

Add the following lines to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-theme-squishy"
gem "jekyll-toc"      # For the Table of Contents
gem "nokogiri"        # For automatic image captions
```

### Step 2: Configure `_config.yml`

Add the following to your `_config.yml` file to enable the theme and its plugins.

```yaml
# Set the theme
theme: jekyll-theme-squishy

# Enable plugins
plugins:
  - jekyll-toc
  - jekyll-feed # Or any other plugins you use

# Whitelist the local plugins folder (for captions)
plugins_dir: _plugins

# Recommended: Enable SASS compression for smaller CSS
sass:
  style: compressed
```

### Step 3: Set Up the Auto-Caption Plugin

Squishy uses a small local plugin for automatic image captions.

1. Create a folder named `_plugins` in your site's root directory.

2. Inside `_plugins`, create a file named `auto_caption.rb`.

3. Copy and paste the following code into `auto_caption.rb`:

    ```ruby
    # _plugins/auto_caption.rb
    #
    # Final attempt at a robust auto-captioning plugin.
    # It hooks into the build process right after Markdown is converted to HTML.

    require 'nokogiri'

    Jekyll::Hooks.register :posts, :post_convert do |post|
    # Use .fragment() because at this stage, the content is not a full HTML page yet.
    doc = Nokogiri::HTML.fragment(post.content)

    # Find every <p> tag that contains exactly one <img> child which has an alt attribute.
    doc.css('p > img:only-child[alt]').each do |img|
        alt_text = img['alt']
        p_tag = img.parent

        # Skip if the alt text is empty.
        next if alt_text.nil? || alt_text.strip.empty?

        # Create the new <figure> HTML as a string.
        figure_html = %(
        <figure class="captioned-image">
            #{img.to_html}
            <figcaption>#{alt_text}</figcaption>
        </figure>
        )

        # Replace the parent <p> tag with the new <figure> block.
        p_tag.replace(figure_html)
    end

    # Update the post's content with our modified HTML.
    post.content = doc.to_html
    end
    ```

### Step 4: Install Everything

Run the bundle command to install the gems and update your `Gemfile.lock`:

```bash
bundle install
```

-----

## 🧭 Usage

### Adding a Table of Contents

To add a TOC to a post, include `toc: true` in the post's front matter.

```yaml
---
layout: post
title: "Your Awesome Post Title"
toc: true
---
```

### Automatic Image Captions

To create a captioned image, just use a standard Markdown image. The `alt` text will automatically be used as the visible caption.

```markdown
![This text will become the caption.](assets/images/my-image.jpg)
```

-----

## 🎨 Customization

You can override any of the theme’s default files. To customize the theme's CSS, create a file at `assets/css/style.scss` in your own site's directory to add or override styles.

-----

## 🤝 Contributing

Bug reports and pull requests are welcome on GitHub.

-----

## 📄 License

This theme is open source and available under the [MIT License](LICENSE).
