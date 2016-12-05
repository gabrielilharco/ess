ESS (European Social Survey)
=========================

Django web application for management, visualization and data analysis of the European Social Survey data collected on 2014.

The application was developed using the following Stack:

- **Django** web development framework (based on Python language).
- **Erwin** data modeler for prototyping.
- **PostreSQL** database, loaded with STATA ESS data.
- **Pgadmin** as database management and administration.
- **Pandas** as data analysis and parser tool (open-source Python library).


Description
-----------

[ESS Official Website](http://www.europeansocialsurvey.org)

The European Social Survey (ESS) is an academically driven cross-national survey that has been conducted across Europe since 2001. Every two years, face-to-face interviews are conducted with newly selected. The ESS is a cross-sectional survey using probability samples which are representative of all persons aged 15 and over resident within private households in each country.

[ESS Available Data](http://www.europeansocialsurvey.org/data/)

For each round, the ESS makes available several data sets: an integrated file including data from all countries participating in that round, interviewer’s questionnaire data, test variables data, contact forms data, media claims data. Round-specific themes or confidentiality reasons might also result in additional data sets being made available for selected variables.

Countries
----------

[ESS Participating Countries](http://www.europeansocialsurvey.org/about/participating_countries.html)

Here is a list of the participating countries along all ESS rounds.

|Round 1 [2002]|Round 2 [2004]|Round 3 [2006]|Round 4 [2008]|Round 5 [2010]|Round 6 [2012]|Round 7 [2014]|Round 8 [2016]|
|--------------|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
|Albania| | | | | |•| | |
|Austria|•|•|•|•|•| |•|•|
|Belgium|•|•|•|•|•|•|•|•|
|Bulgaria| | |•|•|•|•| | |
|Croatia| | | |•|•| | | |
|Cyprus| | |•|•|•|•| | |
|Czech Republic|•|•| |•|•|•|•|•|
|Denmark|•|•|•|•|•|•|•| |
|Estonia| |•|•|•|•|•|•|•|
|Finland|•|•|•|•|•|•|•|•|
|France|•|•|•|•|•|•|•|•|
|Germany|•|•|•|•|•|•|•|•|
|Greece|•|•| |•|•| | | |
|Hungary|•|•|•|•|•|•|•|•|
|Iceland| |•| | | |•| |•|
|Ireland|•|•|•|•|•|•|•|•|
|Israel|•| | |•|•|•|•|•|
|Italy|•|•| | | |•| | |
|Kosovo| | | | | |•| | |
|Latvia| | |•|•| | |•| |
|Lithuania| | | |•|•|•|•|•|
|Luxembourg|•|•| | | | | | |
|Netherlands|•|•|•|•|•|•|•|•|
|Norway|•|•|•|•|•|•|•|•|
|Poland|•|•|•|•|•|•|•|•|
|Portugal|•|•|•|•|•|•|•|•|
|Romania| | |•|•| | | | |
|Russian Federation| | |•|•|•|•| |•|
|Slovakia| |•|•|•|•|•| |•|
|Slovenia|•|•|•|•|•|•|•|•|
|Spain|•|•|•|•|•|•|•| |
|Sweden|•|•|•|•|•|•|•|•|
|Switzerland|•|•|•|•|•|•|•|•|
|Turkey| |•| |•| | | | |
|Ukraine| |•|•|•|•|•| | |
|United Kingdom|•|•|•|•|•|•|•|•|
• Countries taking part in ESS round but data not yet released


Installation
------------

1 - Make sure to have the most recent Python version, PostgreSQL and Pip installed.
2 - Clone our repo:

```bash
git clone https://github.com/gabrielilharco/ess.git
```

3 - Install the project mentioned dependencies:

```bash
pip install -r requirements.txt
```

4 - Create your own PostgreSQL ESS database (check it on pgadmin)

```bash
sudo su - postgres
psql
CREATE DATABASE eesdb;
CREATE USER postgres WITH PASSWORD '123';
GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres;
pgadmin
```

5 - Add a .env file on project directory, with the following content:

```bash
DATABASE_URL='postgres://postgres:123@127.0.0.1:5432/eesdb'
```

6 - Migrate your ESS database:

```bash
python manage.py migrate
```

7 - Run the application:

```bash
python manage.py runserver
```

8 - Go to the browser and access ESS on:

```bash
http://localhost:8000/
```

Developers
----------
Gabriel Ilharco

Matheus Leão

Felipe Tuyama
