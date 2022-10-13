def create(model, en_hash, pt_hash={})
  I18n.locale = 'en'
  object = model.new(en_hash)
  I18n.locale = 'pt'
  object.set(pt_hash)

  I18n.locale = 'en'
  object.save!

  object
end

def project_image(project, path)
  "https://portfolio-arthur-siqueira.s3-sa-east-1.amazonaws.com/projects/#{project}/#{path}"
end

# Locations
pelotas = create(Location,
{
  country: 'Brazil',
  country_code: 'BR',
  state: 'Rio Grande do Sul',
  state_code: 'RS',
  city: 'Pelotas'
},
{
  country: 'Brasil'
})

# Portfolio
portfolio = create(Portfolio,
{
  title: 'Software Engineer',
  about: "Graduated in Computer Science, with over 4 years of professional software development experience.
  In my career I have worked on web and desktop applications, both in front-end and back-end, and currently
  I act as a full-stack web developer. In the teams I've collaborated with, I have found success by being proactive
  and balancing effectiveness in the deliveries with good communication skills to build environments of technical
  and interpersonal trust.",
  phone: '5553991362391',
  email: 'dev.arthursiqueira@gmail.com',
  linkedin: 'arthur-siqueira-e-silva',
  gitlab: 'ArthurSiqueiraS',
  github: 'ArthurSiqueiraS',
  instagram: 'arthursiqueiras',
  location: pelotas
},
{
  title: 'Engenheiro de Software',
  about: 'Formado em Ciência da Computação, com mais de 4 anos de experiência profissional em desenvolvimento
  de software. Em minha carreira já trabalhei em aplicações para web e desktop, no front-end e no back-end, e
  atualmento trabalho como um desenvolvedor full-stack web. Nas equipes com as quais já colaborei, encontrei sucesso
  sendo proativo e equilibrando eficiência nas entregas com boas habilidades de comunicação para construir ambientes
  de cofiança técnica e interpessoal.'
})

# Languages
portuguese = create(Language,
{ name: 'Portuguese', level: 3 },
{ name: 'Português' }
)
english = create(Language,
{ name: 'English', level: 2 },
{ name: 'Inglês' }
)
spanish = create(Language,
{ name: 'Spanish', level: 1 },
{ name: 'Espanhol' }
)

# Employers
hut8 = create(Employer, { name: 'Hut8', link: 'http://hut8.com.br/' })
indeorum = create(Employer, { name: 'Indeorum', link: 'https://indeorum.com/' })
freelance = create(Employer, { name: 'Freelance' })
nelogica = create(Employer, { name: 'Nelogica', link: 'https://www.nelogica.com.br/' })
globant = create(Employer, { name: 'Globant', link: 'https://www.globant.com/pt-br' })
lhl = create(Employer, { name: 'Lighthouse Labs', link: 'https://www.lighthouselabs.ca/' })

# Occupations
front_end_dev = create(Occupation,
{ name: 'Front-end Developer' },
{ name: 'Desenvolvedor Front-end' }
)
web_intern = create(Occupation,
{ name: 'Web Developer Internship' },
{ name: 'Estagiário de Desenvolvimento Web' }
)
full_stack_dev = create(Occupation,
{ name: 'Full-stack Developer' },
{ name: 'Desenvolvedor Full-stack' }
)
tech_lead = create(Occupation,
{ name: 'Tech Lead' },
{ name: 'Líder Técnico' }
)
dev_ops = create(Occupation,
{ name: 'Dev Ops'}
)
designer = create(Occupation,
{ name: 'UX/UI Designer' },
{ name: 'Designer UX/UI'}
)
project_manager = create(Occupation,
{ name: 'Project Manager' },
{ name: 'Gerente de Projeto' }
)
software_dev = create(Occupation,
{ name: 'Software Developer' },
{ name: 'Desenvolvedor de Software' }
)
software_eng = create(Occupation,
{ name: 'Software Engineer' },
{ name: 'Engenheiro de Software' }
)
web_mentor = create(Occupation,
{ name: 'Web Development Mentor' },
{ name: 'Mentor de Desenvolvimento Web' }
)

# Experience
create(Experience,
{
  employer: hut8,
  occupations: [front_end_dev],
  start_date: Date.new(2018, 5),
  end_date: Date.new(2019, 12),
  summary: 'Front-end development for web applications, using React.js and Bootstrap',
},
{
  summary: 'Desenvolvimento front-end para aplicações web, utilizando React.js e Bootstrap'
})
create(Experience,
{
  employer: indeorum,
  occupations: [web_intern],
  start_date: Date.new(2018, 6),
  end_date: Date.new(2020, 1),
})
create(Experience,
{
  employer: indeorum,
  occupations: [full_stack_dev, tech_lead],
  start_date: Date.new(2020, 1),
  end_date: Date.new(2021, 1),
  summary: 'Development of commercial web applications, working in scrum teams and using Vue.js,
  Ruby on Rails and MongoDB as the main development technologies. Also acting as a
  tech lead and responsible for the creation of solutions for complex internal problems
  in different areas, from web applications to data engineering.',
},
{
  summary: 'Desenvolvimento de aplicações web comerciais, trabalhando em equipes de scrum e
  utilizando Vue.js, Ruby on Rails e MongoDB como principais tecnologias de
  desenvolvimento. Também atuando como líder técnico e responsável pela criação de
  soluções para complexos problemas internos em diferentes áreas, de aplicações web
  a engenharia de dados.'
})
create(Experience,
{
  employer: freelance,
  occupations: [full_stack_dev, project_manager, designer, dev_ops],
  start_date: Date.new(2020, 6),
  end_date: Date.new(2020, 7),
  summary: "Worked autonomously in the development of a web platform to promote and broadcast
  the XXXVI Academic Week of Medicine UFPel, in collaboration with the students from
  the event's organizing committee. Developed the front-end with Vue.js (using the Nuxt.js
  framework) and the back-end with Ruby on Rails (API) and MongoDB, integrating the application
  with cloud services such as Heroku, Netlify, Amazon S3 and Youtube."
},
{
  summary: "Trabalhei autonomamente no desenvolvimento de uma plataforma web para promover e
  transmitir a XXXVI Semana Acadêmica de Medicina UFPel, em colaboração com os estudantes da
  comissão organizadora do evento. Desenvolvi o front-end com Vue.js (utilizando o framework
    Nuxt.js) e o back-end com Ruby on Rails (API) e MongoDB, integrando a aplicação com serviços
    de nuvem como Heroku, Netlify, Amazon S3 e Youtube."
  })
  create(Experience,
  {
    employer: nelogica,
    occupations: [software_dev],
    start_date: Date.new(2021, 2),
    end_date: Date.new(2021, 9),
    summary: 'Working on technological solutions for the financial market, mostly on Desktop apps for traders.
  As part of a team of software developers, this role includes creating new features, enhancing
  or fixing older ones, participating in project alignments and regularly reviewing codes from teammates.',
},
{
  summary: 'Desenvolvimento de soluções para o mercado financeiro, em especial aplicações de Desktop para traders.
  Como parte de uma equipe de desenvolvedores de software, este cargo inclui as responsabilidades de
  criar novas funcionalidades, melhorar ou consertar outras mais antigas, participar de alinhamentos de
  projeto e revisar códigos de colegas regularmente.'
})
create(Experience,
{
  employer: globant,
  occupations: [software_eng],
  start_date: Date.new(2021, 9),
  summary: "Working in scrum pods assigned to external Globant consulting clients, as a full-stack engineer with
  focus on the back-end. Besides development, role involves actively participating in scrum processes, analyzing
  business requirements and elaborating technical solutions for the proposed projects and maintaining close 
  communication with the client company's team. Technology stack includes Ruby on Rails, React and PostgreSQL.",
},
{
  summary: 'Colaborando em pods scrum designados para clientes externos de consultoria da Globant, atuando como
  engenheiro full-stack com foco no back-end. Além de desenvolvimento, o cargo envolve participar ativamente dos
  processos de scrum, analisar requisitos de negócio e elaborar soluções técnicas para os projetos propostos e
  manter uma comunicação próxima com a equipe da empresa cliente. O stack tecnológico inclue Ruby on Rails, React
  e PostgreSQL.'
})
create(Experience,
{
  employer: lhl,
  occupations: [web_mentor],
  start_date: Date.new(2021, 8),
  summary: 'As a mentor at Lighthouse Labs, I assisted students from all over the world as they went through the
  extensive web bootcamp curriculum. The course included various practical assignments and predefined or student
  designed projects, covering fundamental programming concepts and web development technologies such as HTML, CSS,
  JavaScript, SQL, React, Ruby on Rails and others.',
},
{
  summary: 'Como um mentor na Lighthouse Labs, eu auxiliei estudantes de diversos países diferentes durante suas
  jornadas pelo extenso currículo do bootcamp web. O curso incluía diversas tarefas práticas e projetos predefinidos
  ou elaborados pelos próprios estudantes, cobrindo conceitos fundamentais de programação e tecnologias de
  desenvolvimento web como HTML, CSS, JavaScript, SQL, React, Ruby on Rails entre outras.'
})

# Education
create(Education,
{
  course: 'Computer Science',
  title: "Bachelor's degree",
  institution: 'Universidade Federal de Pelotas',
  start_date: Date.new(2016, 2),
  end_date: Date.new(2019, 12)
},
{
  course: 'Ciência da Computação',
  title: 'Bacharelado'
})

# Extra info
create(ExtraInfo,
{
  group: 'Awards',
  title: 'Academic Honor',
  subtitle: 'Universidade Federal de Pelotas',
  start_date: Date.new(2020, 2),
  summary: 'Title received for achieving the highest academic performance value among the 2019/2
  UFPel Computer Science graduate class.',
  continuous: false
},
{
  group: 'Premiações',
  title: 'Menção Honrosa',
  summary: 'Título recebido por atingir o maior desempenho acadêmico entre a classe de formandos
  de Ciência da Computação da UFPel do período 2019/2.'
})

# Technologies
technologies = {
  vuejs: create(Technology,
  {
    name: 'Vue.js',
    type: 'front_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/9/95/Vue.js_Logo_2.svg',
    link: 'https://vuejs.org/'
  }),
  nuxtjs: create(Technology,
  {
    name: 'Nuxt.js',
    type: 'front_end',
    logo: 'https://portfolio-arthur-siqueira.s3.sa-east-1.amazonaws.com/technologies/nuxtjs.svg',
    link: 'https://nuxtjs.org/'
  }),
  reactjs: create(Technology,
  {
    name: 'React.js',
    type: 'front_end',
    logo: 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9Ii0xMS41IC0xMC4yMzE3NCAyMyAyMC40NjM0OCI+CiAgPHRpdGxlPlJlYWN0IExvZ288L3RpdGxlPgogIDxjaXJjbGUgY3g9IjAiIGN5PSIwIiByPSIyLjA1IiBmaWxsPSIjNjFkYWZiIi8+CiAgPGcgc3Ryb2tlPSIjNjFkYWZiIiBzdHJva2Utd2lkdGg9IjEiIGZpbGw9Im5vbmUiPgogICAgPGVsbGlwc2Ugcng9IjExIiByeT0iNC4yIi8+CiAgICA8ZWxsaXBzZSByeD0iMTEiIHJ5PSI0LjIiIHRyYW5zZm9ybT0icm90YXRlKDYwKSIvPgogICAgPGVsbGlwc2Ugcng9IjExIiByeT0iNC4yIiB0cmFuc2Zvcm09InJvdGF0ZSgxMjApIi8+CiAgPC9nPgo8L3N2Zz4K',
    link: 'https://reactjs.org/'
  }),
  reactnative: create(Technology,
  {
    name: 'React Native',
    type: 'front_end',
    logo: 'https://cdn.worldvectorlogo.com/logos/react-native-1.svg',
    link: 'https://reactnative.dev/'
  }),
  vuex: create(Technology,
  {
    name: 'Vuex',
    type: 'front_end',
    logo: 'https://portfolio-arthur-siqueira.s3-sa-east-1.amazonaws.com/technologies/vuex.png',
    link: 'https://vuex.vuejs.org'
  }),
  ruby: create(Technology,
  {
    name: 'Ruby',
    type: 'back_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/7/73/Ruby_logo.svg',
    link: 'https://www.ruby-lang.org/en/'
  }),
  rails: create(Technology,
  {
    name: 'Ruby on Rails',
    type: 'back_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/6/62/Ruby_On_Rails_Logo.svg',
    link: 'https://rubyonrails.org/'
  }),
  html: create(Technology,
  {
    name: 'HTML',
    type: 'front_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/6/62/Ruby_On_Rails_Logo.svg',
    link: 'https://developer.mozilla.org/en-US/docs/Web/HTML'
  }),
  js: create(Technology,
  {
    name: 'JavaScript',
    type: 'front_end',
    logo: 'https://portfolio-arthur-siqueira.s3-sa-east-1.amazonaws.com/technologies/javascript.png',
    link: 'https://developer.mozilla.org/en-US/docs/Web/JavaScript'
  }),
  css: create(Technology,
  {
    name: 'CSS',
    type: 'front_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/d/d5/CSS3_logo_and_wordmark.svg',
    link: 'https://developer.mozilla.org/en-US/docs/Web/CSS'
  }),
  mongo: create(Technology,
  {
    name: 'MongoDB',
    type: 'back_end',
    logo: 'https://www.klipfolio.com/sites/default/files/integrations/mongo.png',
    link: 'https://db4beginners.com/wp-content/uploads/2017/10/LogoMongoDB-pq-300x300.png'
  }),
  python: create(Technology,
  {
    name: 'Python',
    type: 'back_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Python-logo-notext.svg',
    link: 'https://www.python.org/'
  }),
  git: create(Technology,
  {
    name: 'Git',
    type: 'back_end',
    logo: 'https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png',
    link: 'https://git-scm.com/'
  }),
  c: create(Technology,
  {
    name: 'C',
    type: 'back_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/C_Programming_Language.svg/695px-C_Programming_Language.svg.png'
  }),
  java: create(Technology,
  {
    name: 'Java',
    type: 'back_end',
    logo: 'https://logospng.org/download/java/logo-java-512.png',
    link: 'https://www.java.com/pt-BR/'
  }),
  postgresql: create(Technology,
  {
    name: 'PostgreSQL',
    type: 'back_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/1200px-Postgresql_elephant.svg.png',
    link: 'https://www.postgresql.org/'
  }),
  linux: create(Technology,
  {
    name: 'Linux',
    type: 'back_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/1200px-Tux.svg.png',
    link: 'https://www.linux.org/'
  }),
  vuetify: create(Technology,
  {
    name: 'Vuetify',
    type: 'front_end',
    logo: 'https://seeklogo.com/images/V/vuetify-logo-3BCF73C928-seeklogo.com.png',
    link: 'https://vuetifyjs.com/en/'
  }),
  bootstrap: create(Technology,
  {
    name: 'Bootstrap',
    type: 'front_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Bootstrap_logo.svg',
    link: 'https://getbootstrap.com/'
  }),
  s3: create(Technology,
  {
    name: 'Amazon S3',
    type: 'back_end',
    logo: 'https://raw.githubusercontent.com/soumyadip007/soumyadip007/master/img/cloud/s3.png',
    link: 'https://aws.amazon.com/s3/?nc1=h_ls'
  }),
  websockets: create(Technology,
  {
    name: 'WebSockets',
    type: 'back_end',
    logo: 'https://portfolio-arthur-siqueira.s3-sa-east-1.amazonaws.com/technologies/websockets.png',
    link: 'https://developer.mozilla.org/en-US/docs/WebSockets'
  }),
  photoshop: create(Technology,
  {
    name: 'Adobe Photoshop',
    type: 'front_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/a/af/Adobe_Photoshop_CC_icon.svg',
    link: 'https://www.adobe.com/br/products/photoshop.html'
  }),
  delphi: create(Technology,
  {
    name: 'Delphi',
    type: 'back_end',
    logo: 'https://upload.wikimedia.org/wikipedia/commons/a/a5/Delphi.svg',
    link: 'https://www.embarcadero.com/br/products/delphi',
  })
}

# Skills
technologies.slice(:reactjs, :vuejs, :ruby, :rails, :git, :html, :js, :css).each do |key, tech|
  create(Skill, technology: tech, level: 5)
end

technologies.slice(:reactnative, :nuxtjs, :vuex, :vuetify).each do |key, tech|
  create(Skill, technology: tech, level: 4)
end

technologies.slice(:postgresql, :delphi, :mongo, :python, :linux, :bootstrap).each do |key, tech|
  create(Skill, technology: tech, level: 3)
end

technologies.slice(:c, :java, :s3, :websockets, :photoshop).each do |key, tech|
  create(Skill, technology: tech, level: 2)
end

# Project statuses
launched = create(ProjectStatus,
{
  name: 'Launched'
},
{
  name: 'Lançado'
})

# Projects

# Cientum 2.0
cientum_2 = create(Project,
{
  title: 'Cientum 2.0',
  description: "Cientum is Indeorum's platform for academic institutions to visualize their
  productions through valuable graphs and customizable metrics. This iteration was the first I worked
  on, it was already a complete application and my job was to maintain and improve on what already
  existed. This is the current live version of Cientum, soon to be replaced by Cientum 3.0.",
  images: Array(1..6).map { |i| project_image('cientum-2.0', "#{i}.jpg") },
  start_date: Date.new(2018, 7),
  end_date: Date.new(2019, 8),
  logo: project_image('cientum-2.0', 'logo.svg'),
  thumbnail: project_image('cientum-2.0', '6.jpg'),
  url: 'https://cientum.indeorum.com/',
  technologies: technologies.slice(:rails, :vuejs, :mongo, :python, :ruby).values,
  employer: indeorum,
  occupations: [full_stack_dev]
},
{
  description: 'Cientum é a plataforma da Indeorum onde instituições acadêmicas podem visualizar
  suas produções através de gráficos valiosos e métricas customizáveis. Esta iteração foi a primeira
  na qual trabalhei, já sendo uma aplicação completa, e meu trabalho era mantê-la e melhorar o que
  já existia. Esta atualmente é a versão pública do Cientum, em breve sendo substituída pelo Cientum 3.0.'
})

create(ProjectHighlight,
{
  project: cientum_2,
  title: 'Legacy code improvements',
  description: "Worked on refactoring and cleaning up old code and improving functionality
  and maintainability of the application.",
  image: project_image('cientum-2.0', '5.jpg'),
  icon: 'update'
},
{
  title: 'Melhorias em código legado',
  description: 'Trabalhei refatorando e limpando códigos antigos e melhorando a funcionalidade
  e manutenibilidade da aplicação.'
})
create(ProjectHighlight,
{
  project: cientum_2,
  title: 'Efficient solutions',
  description: "This was the first professional project in which I brought impactful solutions
  for highly complex problems. In this instance, after a close analysis of the problem and
  original code, I managed to raise the precision of a data crawler script, from 3% to 100%.",
  image: project_image('cientum-2.0', '7.jpg'),
  icon: 'emoji_objects'
},
{
  title: 'Soluções eficientes',
  description: 'Este foi o primeiro projeto profissional em que eu trouxe soluções impactantes
  para problemas complexos. Na ocasião, após uma análise aprofundada do problema e do código
  original, consegui aumentar a precisão de um script de extração de dados, de 3% para 100%.'
})

# Site Hut8
site_hut8 = create(Project,
{
  title: 'Hut8 Website',
  description: 'Web page for the junior enterprise Hut8, of which I was a part of. I worked as a
  front-end developer in this project, leaving it once I graduated and left the company. The site
  was published and currently it is still evolving.',
  images: Array(1..3).map { |i| project_image('site-hut8', "#{i}.jpg") },
  start_date: Date.new(2019, 7),
  end_date: Date.new(2019, 9),
  logo: project_image('site-hut8', 'logo.jpg'),
  url: 'http://hut8.com.br/',
  technologies: technologies.slice(:reactjs, :bootstrap).values,
  employer: hut8,
  occupations: [front_end_dev]
},
{
  title: 'Site Hut8',
  description: 'Página web para a empresa júnior da computação da UFPel, Hut8, da qual fiz parte. Neste projeto
  trabalhei como desenvolvedor front-end, deixando-o quando me formei e saí da empresa. O site foi
  publicado e atualmente ainda está sendo evoluído.'
})

# Cientum 3.0
cientum_3 = create(Project,
{
  title: 'Cientum 3.0',
  description: "Cientum is Indeorum's platform for academic institutions to visualize their
  productions through valuable graphs and customizable metrics. Cientum 3.0 is a new version
  from scratch, maintaining the product's features but builded with separate front-end and
  back-end to optimize maintainability and modernize it's interface.",
  start_date: Date.new(2019, 9),
  end_date: Date.new(2020, 3),
  images: Array(1..5).map { |i| project_image('cientum-3.0', "#{i}.jpg") },
  logo: project_image('cientum-3.0', 'logo.png'),
  thumbnail: project_image('cientum-3.0', '5.jpg'),
  technologies: technologies.slice(:vuejs, :nuxtjs, :vuetify, :vuex, :rails, :mongo).values,
  employer: indeorum,
  occupations: [full_stack_dev]
},
{
  description: 'Cientum é a plataforma da Indeorum onde instituições acadêmicas podem visualizar
  suas produções através de gráficos valiosos e métricas customizáveis. Cientum 3.0 é uma nova
  versão feita do zero, mantendo as funcionalidades do produto mas construída com um front-end
  e back-end separados para otimizar a manutenibilidade e modernizar sua interface.'
})

create(ProjectHighlight,
{
  project: cientum_3,
  title: 'Custom Rails framework',
  description: "Created an abstraction over Rails' standard MVC framework, which was required by
  the project manager to maintain a cleaner code. The resulting strucutre had not only a different
  organization but also utility libraries and generators to make coding even easier.",
  image: project_image('cientum-3.0', 'h1.jpg'),
  icon: 'folder'
},
{
  title: 'Framework Rails personalizado',
  description: "Criei uma abstração sobre o framework MVC padrão do Rails, o que foi um requisito
  do gerente de projeto para manter um código mais limpo. A estrutura resultante contava não somente
  com uma organização diferente, mas também com bibliotecas utilitárias e geradores para tornar a
  programação ainda mais fácil."
})
create(ProjectHighlight,
{
  project: cientum_3,
  title: 'Team coordination',
  description: "Despite not being a project manager, since it was a small team and we had built
  the application from the ground, with myself participating in every area of the project, I
  became a central figure that could help other teammates in their own issues and in communicating
  front-end with back-end properly.",
  icon: 'group'
},
{
  title: 'Coordenação de equipe',
  description: "Embora não fosse um gerente de projeto, como a equipe era pequena e tínhamos
  construído a aplicação do zero, comigo participando em todas as áreas do projeto, eu me
  tornei uma figura central que conseguia ajudar meus colegas com seus próprios problemas e
  na comunicação eficiente entre front-end e back-end."
})

# Vidium
vidium = create(Project,
{
  employer: indeorum,
  occupations: [front_end_dev, tech_lead],
  title: 'Vidium',
  description: 'This project was originated from the emergency of the COVID-19 pandemic in the
  first semester of 2020. Vidium was made to help healthcare providers in keeping an organized
  record of the numerous screenings being made and calls being received, as well as having a video
  call feature that connects patients with doctors via telemedicine. The application was launched in
  less than a week, since then being used for hundreds of screenings.',
  technologies: technologies.slice(:vuejs, :nuxtjs, :vuetify, :vuex, :websockets).values,
  start_date: Date.new(2020, 3),
  end_date: Date.new(2020, 11),
  images: Array(1..8).map { |i| project_image('vidium', "#{i}.jpg") },
  logo: project_image('vidium', 'logo.png'),
  thumbnail: project_image('vidium', '2.jpg'),
  url: 'https://indeorum.com/health/vidium'
},
{
  description: 'Este projeto se originou na emergência da pandemia do COVID-19 no primeiro semestre
  de 2020. O Vidium foi criado para ajudar provedores de saúde a manter um registro organizado dos
  inúmeros atendimentos e triagens realizadas no momento, também fornecendo um serviço de chamada
  por vídeo que conecta pacientes e médicos via telemedicina. A aplicação foi lançada em menos de
  uma semana, desde então sendo utilizada para centenas de triagens.'
})
create(ProjectHighlight,
{
  project: vidium,
  title: 'Video calls with WebRTC',
  description: "In order to create a proprietary and customizable solution, I used the WebRTC API
  to develop Vidium's video call room, which was one of my major accomplishments in this project.",
  image: project_image('vidium', 'h1.jpg'),
  icon: 'videocam'
},
{
  title: 'Chamadas de vídeo com WebRTC',
  description: 'Para criar uma solução proprietária e personalizável, eu utilizei a API WebRTC para
  desenvolver a sala de video chamada do Vidium, o que foi uma de minhas maiores conquistas neste projeto.'
})

# Semana Acadêmica
sam = create(Project,
{
  employer: freelance,
  occupations: [full_stack_dev, dev_ops, designer, project_manager],
  title: 'XXXVI Academic Week of Medicine UFPel',
  description: 'This was my first freelance and first complete solo project, in which I designed,
  developed and launched an online platform to promote and broadcast the Academic Week of Medicine
  (AWM) of the Federal University of Pelotas.',
  technologies: technologies.slice(
    :vuejs,
    :nuxtjs,
    :vuetify,
    :vuex,
    :websockets,
    :rails,
    :mongo,
    :s3)
  .values,
  start_date: Date.new(2020, 6),
  end_date: Date.new(2020, 7),
  images: Array(1..5).map { |i| project_image('semana-academica', "#{i}.jpg") },
  logo: project_image('semana-academica', 'logo_purple.png'),
  thumbnail: project_image('semana-academica', '2.jpg'),
  url: 'https://sam2020.netlify.app/login/'
},
{
  title: 'XXXVI Semana Acadêmica de Medicina UFPel',
  description: 'Este foi meu primeiro projeto freelance e primeiro projeto completamente solo, no
  qual eu criei o design, desenvolvi e lancei uma plataforma online para promover e transmitir a
  Semana Acadêmica de Medicina (SAM) da Universidade Federal de Pelotas.'
})
create(ProjectHighlight,
{
  project: sam,
  title: 'Admin control',
  description: 'To make the life of the organizing committee easier, the website had a complete
  admin area, with tables to freely create and remove content and a background structure to turn
  the event on and off, letting participants mark their presence when the event was online.',
  image: project_image('semana-academica', 'h1.jpg'),
  icon: 'settings'
},
{
  title: 'Controle de administradores',
  description: 'Para tornar a vida do comitê organizador mais simples, o website continha uma área
  de administração completa, com tabelas para livremente adicionar e remover conteúdos e uma
  estrutura interna ativar e desativar o evento, permitindo que os participantes marcassem
  sua presença quando o evento estava online.'
})
create(ProjectHighlight,
{
  project: sam,
  title: 'Seamless Youtube integration',
  description: "To create the best experience for the event, a livestream room played a Youtube
  embedded video, with a customized layer on top of the player, fitting the theme of the website.",
  image: project_image('semana-academica', 'h2.jpg'),
  icon: 'ondemand_video',
},
{
  title: 'Integração discreta com Youtube',
  description: 'Para criar uma melhor experiência para o evento, uma sala de livestream executava
  um vídeo do Youtube embutido, com uma camada customizada sobre o player de vídeo, combinando com
  o tema visual do site.',
})

# Doctour
doctour = create(Project,
{
  employer: indeorum,
  occupations: [front_end_dev],
  title: 'Doctour',
  description: "My last project at Indeorum was a Telemedicine platform for tourists, in collaboration
  with mexican company Doctour. This project had a big focus on the interace styling to fit the existing
  visual branding of the company. My challenge as a front-end lead was to build a base of highly
  customized components that would be used to give life to the high-fidelity page designs.",
  technologies: technologies.slice(
    :vuejs,
    :nuxtjs,
    :vuetify,
    :vuex
  )
  .values,
  start_date: Date.new(2020, 11),
  end_date: Date.new(2021, 1),
  images: Array(1..6).map { |i| project_image('doctour', "#{i}.jpg") },
  logo: project_image('doctour', 'logo.png'),
  thumbnail: project_image('doctour', '1.jpg')
},
{
  title: 'Doctour',
  description: 'Meu último projeto na Indeorum foi uma plataforma de Telemedicina para turistas, em
  colaboração com a empresa mexicana Doctour. Este projeto tinha um grande foco na estilização da interface,
  para que casasse com o branding visual já existente da empresa. Meu desafio como lead de front-end foi
  construir uma base de components altamente customizados que seriam utilizados para dar vida ao design robusto
  da aplicação.'
})
create(ProjectHighlight,
{
  project: doctour,
  title: 'Customized components',
  description: 'With the use of UI Framework Vuetify, a catalog of components was created to streamline the
  development and maintain a standard style through different pages effortlessly. To keep visuals and
  functionality faithful to what the UX team designed, some standard components from the library were severely
  customized and expanded to be both matching the desired style and highly reusable.',
  image: project_image('doctour', 'h1.jpg'),
  icon: 'view_quilt'
},
{
  title: 'Componentes customizados',
  description: 'Com o uso do Framework de UI Vuetify, foi criado um catálogo de componentes para tornar o
  desenvolvimento mais fácil e manter um estilo padrão em todas as páginas sem muito esforço. Para manter visuais
  e funcionalidade fieis ao que a equipe de UX elaborou, alguns componentes padrões da biblioteca foram intensamente
  alterados e expandidos, tanto para atingir o estilo desejado quanto para torná-los altamente reutilizáveis.'
})
