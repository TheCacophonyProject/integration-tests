# Integration-tests
This project contains integration tests written in [cypress](https://www.cypress.io/) that will check the various parts of the Cacophony ecosystem work together.
These are intended to be run on both test and production, as well as developers computers.

## Ecosystem Requirements
To run these test you need the following system components to run against
* [cacophony-browse](https://github.com/TheCacophonyProject/cacophony-browse) A working web interface.

## Development set up
``` bash
# install dependencies
npm install

# run interactive test runner
npm run dev
```
## CI set up
``` bash
npm install
npm run prod
```