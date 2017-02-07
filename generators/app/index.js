'use strict';
var Generator = require('yeoman-generator');
var fs = require('fs');
// var path = require('path');

module.exports = class extends Generator {
    // constructor(args, opts) {
    //     // Calling the super constructor is important so our generator is correctly set up
    //     super(args, opts);
    // }

    writing() {
        fs.readdir(this.sourceRoot(), (err, items) => {
            for (let item of items) {
                // Copy all items to our root
                let fullPath = this.templatePath(item);
                if (fs.lstatSync(fullPath).isDirectory()) {
                    this.bulkDirectory(item, item);
                } else {
                    this.fs.copyTpl(
                        this.templatePath(item),
                        this.destinationPath(item), {
                        }
                    );
                }
            }
        });
    }
};
