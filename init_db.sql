-- Create the 'user' table if it doesn't exist
DO $$
BEGIN
   IF NOT EXISTS (
       SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = 'user'
   ) THEN
       CREATE TABLE "user" (
           "id" SERIAL PRIMARY KEY,
           "firebase_uid" VARCHAR(255) UNIQUE NOT NULL,
           "name" VARCHAR(255) NOT NULL,
           "email" VARCHAR(255) NOT NULL
       );
   END IF;
END $$;

-- Insert the user if they don't exist
DO $$
BEGIN
   IF NOT EXISTS (
       SELECT 1 FROM "user" WHERE "firebase_uid" = 'j5sfdxfHfBgzz0w4yAOzYv5T9UQ2'
   ) THEN
       INSERT INTO "user" ("firebase_uid", "name", "email") VALUES ('j5sfdxfHfBgzz0w4yAOzYv5T9UQ2', 'dhess', 'neomage2021@gmail.com');
   END IF;
END $$;
