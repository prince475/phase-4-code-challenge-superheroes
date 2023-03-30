# README
# SA-02: Phase-4-Code-Challenge: Superheroess

## Learning Goals:

Build an API using Rails.

## Requirements

For this project, I am required to:

Create a Rails API backend.
Have at least three resources (three DB tables).

## Setup

### Pre-Requisites

In order to use this repository you will need the following:

- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- An account on Postman API Platform. [CLICK HERE TO CREATE ONE](https://www.postman.com/)
- RAM >= 4GB
- Free Space >= 2GB

**NOTE: The screenshots attached use localhost routes for illustration but the live link below works the same way.**

#### REMOTE SERVER TESTING

1. Copy the below live link of the of the API:

```


```

2. Open Postman on your browser and on your workspace, paste the live link where the API server is running.

![](/readme_resources/getstarted.png)

3. Test the deliverables by appending the routes under **ROUTES Deliverables** to the URL above and making the relevant HTTP requests.

#### LOCAL SERVER TESTING

You can also set up this repository by following this manual

1. Clone the repository
   ```bash
   git clone https://github.com/prince475/phase-4-code-challenge-superheroes.git
   ```
2. Ensure the ruby gems are setup in your machine
   ```bash
   bundle install
   ```
3. Perform any pending database migrations and seed data
   ```bash
   rails db:migrate db:seed
   ```
4. Make sure no other application is already running on PORT 3000 and run the application
   ```bash
   rails s
   ```
5. Open Postman on your browser and on your workspace, paste this link where the API server is running

   ```
   http://localhost:3000
   ```

   ![](/readme_resources/getstarted.png)

6. Test the deliverables by appending the routes under **ROUTES Deliverables** to the URL above and making the relevant HTTP requests.
   Attached images illustrate the requests.

## MODEL Deliverables

Create the following relationships:

- A `Hero` has many `Power`s through `HeroPower`
- A `Power` has many `Hero`s through `HeroPower`
- A `HeroPower` belongs to a `Hero` and belongs to a `Power`

![](/readme_resources/o2m.png)

## VALIDATIONS Deliverables

Add validations to the `HeroPower` model:

- `strength` must be one of the following values: 'Strong', 'Weak', 'Average'
  ![](/readme_resources/VAL.jpg)

## ROUTES Deliverables:

Set up the following routes. Make sure to return JSON data in the format
specified along with the appropriate HTTP verb.

#### GET /heroes

Return JSON data in the format below:

```json
[
	{ "id": 1, "name": "Kamala Khan", "super_name": "Ms. Marvel" },

	{ "id": 2, "name": "Doreen Green", "super_name": "Squirrel Girl" },

	{ "id": 3, "name": "Gwen Stacy", "super_name": "Spider-Gwen" }
]
```

![](/readme_resources/getheroes.png)

#### GET /heroes/:id

If the `Hero` exists, return JSON data in the format below:

```json
{
	"id": 1,
	"name": "Kamala Khan",
	"super_name": "Ms. Marvel",
	"powers": [
		{
			"id": 1,
			"name": "super strength",
			"description": "gives the wielder super-human strengths"
		},
		{
			"id": 2,
			"name": "flight",
			"description": "gives the wielder the ability to fly through the skies at supersonic speed"
		}
	]
}
```

![](/readme_resources/showheroes.png)

If the `Hero` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{ "error": "Hero not found" }
```

![](/readme_resources/heronotfound.png)

#### GET /powers

Return JSON data in the format below:

```json
[
	{
		"id": 1,
		"name": "super strength",
		"description": "gives the wielder super-human strengths"
	},
	{
		"id": 1,
		"name": "flight",
		"description": "gives the wielder the ability to fly through the skies at supersonic speed"
	}
]
```

![](/readme_resources/indexpowers.png)

#### GET /powers/:id

If the `Power` exists, return JSON data in the format below:

```json
{
	"id": 1,
	"name": "super strength",
	"description": "gives the wielder super-human strengths"
}
```

![](/readme_resources/showpowers.png)

If the `Power` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
	"error": "Power not found"
}
```

![](/readme_resources/powernotfound.png)

#### PATCH /powers/:id

This route should update an existing `Power`. It should accept an object with
the following properties in the body of the request:

```json
{
	"description": "Updated description"
}
```

If the `Power` exists and is updated successfully (passes validations), update
its description and return JSON data in the format below:

![](/readme_resources/updatepower.png)

If the `Power` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
	"error": "Power not found"
}
```

![](/readme_resources/updatenotfound.png)

If the `Power` is **not** updated successfully (does not pass validations),
return the following JSON data, along with the appropriate HTTP status code:

```json
{
	"errors": ["validation errors"]
}
```

![](/readme_resources/shortdescription.png)

#### POST /hero_powers

This route should create a new `HeroPower` that is associated with an
existing `Power` and `Hero`. It should accept an object with the following
properties in the body of the request:

```json
{
  "strength": "Average",
  "power_id": 1,
  "hero_id": 3
}
```

If the `HeroPower` is created successfully, send back a response with the data
related to the `Hero`:

```json
{
	"id": 1,
	"name": "Kamala Khan",
	"super_name": "Ms. Marvel",
	"powers": [
		{
			"id": 1,
			"name": "super strength",
			"description": "gives the wielder super-human strengths"
		},
		{
			"id": 2,
			"name": "flight",
			"description": "gives the wielder the ability to fly through the skies at supersonic speed"
		}
	]
}
```

![](/readme_resources/heropowersuccess.png)

If the `HeroPower` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
	"errors": ["validation errors"]
}
```

![](/readme_resources/heropowererror.png)

## Authors

Project contributed to and maintained by:

- [Prince Daniel](https://github.com/prince475/)

## ISC

### ISC License (ISC)

[![License: ICL](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/ISC)
