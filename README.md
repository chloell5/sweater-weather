<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<h3 align="center">Sweater Weather</h3>

  <p align="center">
    An API project for road trip weather in Ruby on Rails
    <br />
    <a href="https://github.com/chloell5/rails-engine"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/chloell5/rails-engine/issues">Report Bug</a>
    ·
    <a href="https://github.com/chloell5/rails-engine/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This is a solo project for the Turing School of Software and Design. In it, we learned how to build a backend that connects multiple API requests into one project. Includes user registration and login, weather details, trip information, and a picture of the location. Simply clone down and run on localhost to get started!

API keys can be requested from:
<br />
<a href="https://developer.mapquest.com/documentation/geocoding-api/">MapQuest</a>
<a href="https://openweathermap.org/api/one-call-api">Open Weather</a>
<a href="https://unsplash.com/developers">Unsplash</a>
<br />
After cloning the repo:
  1. `bundle install`
  2. Install the <a href="https://github.com/laserlemon/figaro">Figaro</a> Gem
  3. Place your API keys in /config/application.yml (as mapquest_api: weather_api: and background_api:)
  4. Run `rails db:{create,migrate}`
  5. Run `rails s`
  6. API endpoints are:

    /api/v1/forecast
    /api/v1/backgrounds
    /api/v1/users
    /api/v1/sessions
    /api/v1/road_trip
<br />
<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* Ruby
* Rails
* PostgreSQL
* RSpec
* Postman

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Chloe Price - [@chloell5](https://twitter.com/chloell5) - chloell@protonmail.ch

Project Link: [https://github.com/chloell5/rails-engine](https://github.com/chloell5/sweater-weather)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* Thank you Turing, and your wonderful instructors!

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/chloell5/rails-engine.svg?style=for-the-badge
[contributors-url]: https://github.com/chloell5/rails-engine/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/chloell5/rails-engine.svg?style=for-the-badge
[forks-url]: https://github.com/chloell5/rails-engine/network/members
[stars-shield]: https://img.shields.io/github/stars/chloell5/rails-engine.svg?style=for-the-badge
[stars-url]: https://github.com/chloell5/rails-engine/stargazers
[issues-shield]: https://img.shields.io/github/issues/chloell5/rails-engine.svg?style=for-the-badge
[issues-url]: https://github.com/chloell5/rails-engine/issues
[license-shield]: https://img.shields.io/github/license/chloell5/rails-engine.svg?style=for-the-badge
[license-url]: https://github.com/chloell5/rails-engine/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/chloe-price-1705
[product-screenshot]: images/screenshot.png
