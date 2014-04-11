# mongoose-ownable

a mongoose plugin adding owner_id to model instance and findByIdAndOwnerId static methods

## Install
Install the module with:

```bash
npm install mongoose-ownable
```

## Usage
```javascript
var ownable = require('mongoose-ownable');

var TestSchema = new Schema({});

TestSchema.plugin(ownable);

TestModel = mongoose.model("Test", TestSchema);

```

## License
Copyright (c) 2014 yi
Licensed under the MIT license.
