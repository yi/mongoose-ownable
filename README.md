# mongoose-trashable

a mongoose plugin adding ablity to model instance to be trashed (soft deleted) / untrashed

adding following instance method to mongoose model:
 * trash() : mark an instance object as trashed
 * untrash() : recover a trashed object

## Install
Install the module with:

```bash
npm install mongoose-trashable
```

## Usage
```javascript
var trashable = require('mongoose-trashable');

var TestSchema = new Schema({});

TestSchema.plugin(transable);

TestModel = mongoose.model("Test", TestSchema);

instance = new TestModel()
instance.trash(function(err, doc) {
    console.log("after trashed_at: doc.trashed_at:"+doc.trashed_at);
    doc.untrashed(function(err, doc){
      console.log("after untrashed: doc.trashed_at:"+doc.trashed_at);
    });
});

```

## License
Copyright (c) 2014 yi
Licensed under the MIT license.
