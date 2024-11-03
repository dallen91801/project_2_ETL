-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/BHB0RV
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Categories" (
    "category_id" VARCHAR(30)   NOT NULL,
    "category" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategories" (
    "subcategory_id" VARCHAR(30)   NOT NULL,
    "subcategory" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Subcategories" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" SERIAL   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "email" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "Campaign_Cleansed" (
    "cf_id" SERIAL   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(30)   NOT NULL,
    "description" TEXT   NOT NULL,
    "goal" NUMERIC   NOT NULL,
    "pledged" NUMERIC   NOT NULL,
    "outcome" VARCHAR(30)   NOT NULL,
    "backers_count" INTEGER   NOT NULL,
    "country" VARCHAR(30)   NOT NULL,
    "currency" VARCHAR(30)   NOT NULL,
    "launch_date" TIMESTAMP   NOT NULL,
    "end_date" TIMESTAMP   NOT NULL,
    "category" VARCHAR(50)   NOT NULL,
    "subcategory" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Campaign_Cleansed" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "Campaign_Cleansed" ADD CONSTRAINT "fk_Campaign_Cleansed_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign_Cleansed" ADD CONSTRAINT "fk_Campaign_Cleansed_category" FOREIGN KEY("category")
REFERENCES "Categories" ("category_id");

ALTER TABLE "Campaign_Cleansed" ADD CONSTRAINT "fk_Campaign_Cleansed_subcategory" FOREIGN KEY("subcategory")
REFERENCES "Subcategories" ("subcategory_id");

