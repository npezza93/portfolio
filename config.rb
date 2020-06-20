require "lib/email"

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def projects
    {
      n2: "N2 Publishing",
      archipelago: "Archipelago",
      github: "Open Source Contributions",
      cal: "California University of PA Class Advisor",
      eighty: "Eighty",
      spoonflower: "Spoonflower",
    }
  end

  def email_url
    "https://portfoliomailserver.herokuapp.com/emails"
  end

  def site_key
    "6LdJ_c8UAAAAAJ5KeEWBfWivJ9JQhNw0BRADmDy_"
  end

  def recaptcha
    id = "recaptcha_token_#{SecureRandom.hex(10)}"

    %Q{
      <input name="recaptcha_token" type="hidden" id="#{id}"/>
      <script>
        grecaptcha.ready(function() {
          grecaptcha.execute('#{site_key}', {action: 'email'}).then(function(token) {
            document.getElementById("#{id}").value = token;
          });
        });
      </script>
    }
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: ".tmp/dist",
  latency: 1
