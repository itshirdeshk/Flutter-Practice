const multer = require("multer");
const multerS3 = require("multer-s3-transform");
const {
    S3
} = require("aws-sdk");
const config = require("../config/s3.config");

const s3 = new S3({
    credentials: {
        accessKeyId: config.AWS_ACCESS_KEY_ID,
        secretAccessKey: config.AWS_SECRET_ACCESS_KEY
    }
});

const upload = multer({
    storage: multerS3({
        s3: s3,
        bucket: config.AWS_BUCKET_NAME,
        acl: 'public-read',
        key: function(req, file, cb){
            if(file.fieldname == "singlefile"){
                cb(null, "single/" + file.originalname);
            }
            else if(file.fieldname == "multiplefile"){
                cb(null, "multiple/" + file.originalname);
            }
        }
    })
});

module.exports = upload.fields([
    {
        name: 'singlefile', maxCount: 1
    },
    {
        name: 'multiplefile', maxCount: 5
    }
])