# Relational Rails

## Learning Goals
- Design a one to many relationship using a schema designer
- Write migrations to create tables with columns of varying data types and foreign keys.
- Use Rails to create web pages that allow users to CRUD resources
- Create instance and class methods on a Rails model that use ActiveRecord methods and helpers
- Write model and feature tests that fully cover data logic and user behavior

## Requirements
- must use Rails 5.2.4.x
- must use PostgreSQL
- must “handroll” all routes (no use of resources syntax)

## Permission
if there is a specific gem you’d like to use in the project that is not mentioned in this project page, please get permission from your instructors first

## Relationships

### Design your database

Read this lesson plan and use it as a reference when designing your database.

Each person will come up with their own one to many relationship. This should represent a real world example of your choice. An example would be:

- Shelters and Pets
- A Shelter has many Pets
- A Pet belongs to one Shelter.

Do not use Parent/Child as your relationship

These relationships are yours to create, but we instructors are happy to provide feedback on the relationships if asked.

You can create as many columns on each table as you would like, but we need a few columns represented on each table:

1. One string column for a ‘name’
1. One boolean column
1. One numeric column
1. Two DateTime columns: created_at and updated_at

A couple of things to keep in mind as you’re designing your schema:

- Foreign Keys do not count as an integer column
- You should not create columns that duplicate data. For example, in Pets/Shelters, a Shelter should not store a “pet_count” column since the count of Pets can also be found by counting the number of associated pets

#### Schema Design will be reviewed at our first check-in

## User Stories
In these stories, we will refer to the “one” side of the relationship as the “parent” and the “many” side of the relationship as the “children/child”. In the Pets/Shelters example, Shelter would be the Parent and Pets would be the Children.

Children can be associated to the Parent. Children belong to a parent. Anywhere you see child_table_name think pets from our Pets and Shelters example.

Each user story will focus on one of the following:

#### ActiveRecord

#### CRUD Functionality

Usability: Users should be able to use the site easily. This means making sure there are links/buttons to reach all parts of the site and the styling/layout is sensible.