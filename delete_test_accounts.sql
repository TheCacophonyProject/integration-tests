BEGIN;

-- Delete privilages for test users
DELETE FROM "GroupUsers" where "UserId" in (select "id" from "Users" u where u."username" like 'cypress_%');
DELETE FROM "GroupUsers" where "GroupId" in (select "id" from "Groups" g where g."groupname" like 'cypress_%');

-- Delete Tracks, Tags and TrackTags attached to test recordings
DELETE FROM "Tags" where "RecordingId" in (
    select "id" from "Recordings" r where r."DeviceId" in (
        select "id" from "Devices" d where d."devicename" like 'cypress_%'
        )
    );

DELETE FROM "TrackTags" where "TrackId" in (
    select "id" from "Tracks" t where t."RecordingId" in (
        select "id" from "Recordings" r where r."DeviceId" in (
            select "id" from "Devices" d where d."devicename" like 'cypress_%'
        )
    )
);

DELETE FROM "Tracks" where "RecordingId" in (
    select "id" from "Recordings" r where r."DeviceId" in (
        select "id" from "Devices" d where d."devicename" like 'cypress_%'
    )
);

-- Delete recordings made by test groups and devices
DELETE FROM "Recordings" where "DeviceId" in (select "id" from "Devices" d where d."devicename" like 'cypress_%');
DELETE FROM "Recordings" where "GroupId" in (select "id" from "Groups" g where g."groupname" like 'cypress_%');
DELETE FROM "Recordings" where "DeviceId" in (select "id" from "Devices" d where d."devicename" like 'cypress_%');

-- delete users device and groups from testing
DELETE FROM "Users" where "username" like 'cypress_%';
DELETE FROM "Devices" where "devicename" like 'cypress_%';
DELETE FROM "Groups" where "groupname" like 'cypress_%';

END;