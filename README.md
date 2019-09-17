# Ruby Interview Project

It’s our belief at Abstract that there’s no better way to learn how people work than to actually give them something to work on. Because of this, we’d like you to complete a small project as part of your interview process.

We will pay you for your work on this project. Your effort is worth payment. We pay $125 per hour for interview projects. If this seems unreasonable, please let us know. If you are hired, we’ll pay your project on your first paycheck. If not, you’ll receive payment and a 1099 for your work. Please track your hours as a log of what you’ve done and when.

You have one week to complete this project. We’ve worked hard to refine the scope so that it only takes about 8-10 hours to complete. If you start to think the project will take you longer than 10 hours, please let us know immediately.

If you have any questions about the project, please add them as comments in this document and we’ll reply inline.

## Submitting Your Project

We have shared this git repository with you for pushing your project. Please create a pull request and add **@robhartsock**, **@anthony-j-castro**, and **@labe** as reviewers when you’re ready to submit your project. We’ll likely ask you some questions on the PR.

## The Brief

We would like for you to build a simple HTTP based JSON API for retrieving and updating stored information about beehives.  The project must be written using Rails 5.

We’re leaving a lot of the details of the specific API implementation up to you to see how you approach answering the question: What will someone consuming this API need?

A beehive is a man-made enclosure built for the purpose of raising a colony of honeybees. The internal structure of the beehive includes tightly-packed hexagonal cells used for storing food and raising the young (eggs, larvae, and pupae). For the purposes of this exercise, you can assume that each cell is either empty or contains honey, pollen, an egg, a larvae, or a pupa. 

This project is obviously fictional and won’t be shipped, but does touch on the kind of API work Ruby team members do day to day.

You will need to generate a database and seed data to represent your beehive. Please use either MySQL or PostgreSQL, and use Rails migrations to create the database.

The project should include the following HTTP endpoints. The URLs are up to you.

- Return a particular beehive
- Return a particular cell
- Cumulative data about cells by type
- Update a cell

### Return a Particular Beehive

The Return a Particular Beehive endpoint should accept a beehive’s unique id and return information about that beehive, its cells, and any other information you think is appropriate.

### Return a Particular Cell

The return a particular cell endpoint should take in a cell’s unique id and return any information about the cell that you think is appropriate.

### Cumulative Cells by Type

This endpoint should accept a unique beehive id return information about the beehive’s cells, aggregated by type. This should include at least a count of each type, as well as any other information you think is appropriate.

### Update a Cell

The update cell endpoint should accept a cell’s unique id, the type you want to assign, and any other information you think is relevant to the action. It should update the type and return updated information about the cell. 

## Evaluation Criteria

We are not looking for a fully production-worthy application in the space of eight hours. We’re more interested in the organization of your code, your architecture choices, and your ability to think critically about what a consumer of your API would need to get out of it. Specific scoring criteria include:

- [ ] Presence and correctness of setup instructions
- [ ] Database schema - is it sensible and extendable?
- [ ] Are all four endpoints present and functional?
- [ ] Is the code performant?
- [ ] Is there good documentation?
- [ ] Is there good testing?

Areas that are out of scope include:

- Authentication and authorization
- Updating any other aspect of a cell
- Destruction of any objects in the database via API call
