<a name="readme-top"></a>

<div align="center">

  <h3><b>Blog App</b></h3>

</div>


# ð Table of Contents

- [ð About the Project](#about-project)
  - [ð  Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [ð» Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
- [ð¥ Authors](#authors)
- [ð­ Future Features](#future-features)
- [ð¤ Contributing](#contributing)
- [â­ï¸ Show your support](#support)
- [ð Acknowledgements](#acknowledgements)
- [â FAQ](#faq)
- [ð License](#license)


# ðBlog App: Controllers-specs<a name="about-project"></a>
> `Blog APP` is a rails application which allows customers to create posts, add comments, likes the posts. It also allowers users to display whole blog post authors, posts for each author, comments for each post, the number of posts for each user, and the number of comments and likes for each post. In this project, unit tests for each component using `rspec-rails` and integration tests for each view is also implemented.


`Authentication using devise` is the ninth milestone of the `Blog App` project intended for Microverse students to exercise on creating authetication using devise gem.
## ð  Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Ruby</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/">PostgreSQL</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
  <summary>Relish</summary>
  <ul>
    <li><a href="https://relishapp.com/rspec/">RSpec rspec-rails</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Add methods(new, create) for each form**
- **Create form templates using `form_wth rails form helper**
- **Create partials to be embedded in main templates**
- **Optimize databse table queries(applied in `posts#index` template)**
- **Write integration tests for each view in the project**
- **Can register a user**
- **Asks fo confirmation of an email**
- **A user can reset a password**
- **Login fields changed to be username and password**


<p align="right">(<a href="#readme-top">back to top</a>)</p>



## ð» Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- `have installed ruby, git, npm, rails, gem`


### Setup

Clone this repository to your desired folder:


  cd my-folder
  git clone git@github.com:amare1990/Blog-App.git


### Install

Install this project with:

  cd `Blog-App`
  gem install rails
  Add `rspec-rails` bundle in `gem` module
  Bundle Install


### Usage

To run the project, execute the following command:

  - Run the command `rails server`
  - Start the rails server and append the corresponding `urls pattern`.

### Test
To test each unit tests of the project, execute the following command in your root directory of this repo.
  - `rspec spec/folder/unit_test_spec.rb,` e.g rspec spec/controllers/users_controller.rb
  - `rspec` - to test all the test units at a time.


<p align="right">(<a href="#readme-top">back to top</a>)</p>



## ð¥ Authors <a name="authors"></a>


ð¤ **Amare Kassa**

- GitHub: [@githubhandle](https://github.com/amare1990)
- Twitter: [@twitterhandle](https://twitter.com/amaremek)
- LinkedIn: [@linkedInhandle](https://www.linkedin.com/in/amaremek/)

ð¤ **Gabriel Andrade**

- GitHub: [@gandradep](https://github.com/gandradep)
- Twitter: [@leribagandrade](https://twitter.com/leribagandrade)
- LinkedIn: [Gabriel-Andrade](https://www.linkedin.com/in/gabriel-andrade-silla-turca/)

## ð­ Future Features <a name="future-features"></a>


- **Authorizing logged in users**
- **Creating API for the application**


## ð¤ Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

> Feel free to check the [issues page](https://github.com/amare1990/Blog-App/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## â­ï¸ Show your support <a name="support"></a>


> Please â­ï¸ this repository if you think the project is useful for you.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ð Acknowledgments <a name="acknowledgements"></a>


I would like to thank ruby on rails guide which is full of rich information and again Microverse that provides the right material that helps me to improve skills on RoRs.


## â FAQ <a name="faq"></a>


- **Does this project milestone accept data via forms?**
  - Yes

- **Do you see the right information in each template for data you inserted via `rails c`**

  - Yes

   **Did you additional fields other than the model field in the form**

  - No

   **Does the optimized query improve the preformance of the query speed?**

  - Yes

  **did you implement the authentication from the scratch**

  - No



<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ð License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.


<p align="right">(<a href="#readme-top">back to top</a>)</p>
