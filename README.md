# Agile Roadmap

¿Estás interesado en implantar prácticas ágiles? ¿No sabes por dónde comenzar?
Este sitio te ofrece conocimiento asociado a prácticas ágiles y te ayuda a establecer
tu propio roadmap para implantación de prácticas ágiles

http://agile-roadmap.tuneupprocess.com/

## Developing

### Deploy

1) Precompile assets with: `rails assets:precompile`

2) `git push heroku master`

3) Migrate database if necessary: `heroku run rake db:migrate`

### Running tests

1) Ensure you have seeded your test DB with `RAILS_ENV=test rails db:seed`

2) Run tests with RSpec: `rspec`
