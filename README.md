# E-Commerce Feature Store Template

#### WHT version: [0.1.0](https://drive.google.com/drive/folders/1aFAHfIRnFXf9AIFr9SEnROiwOX9TAG3N)


## How to Use
After installing RS360 you can run the following comand:
```shell
wht run
```

There are a few views in the `views/` directory. They are supposed to be created in teh warehouse before the project is run

In models folder, we have `ml-features_window_features.bkp_yaml` file added in case of debugging the window functions

In the `ml-features.yaml` file, all features that rely on window functions are commented out, as there's a pending fix on inputvars that need to be merged before they are tested. 

## Know More
[DBT Project](https://github.com/rudderlabs/data-apps-ecommerce-template)

[Progress Report](https://www.notion.so/Progress-Report-Expressing-E-commerce-Features-in-RS360-Feature-YAML-05549551b61a43669b57fdf80b43f9af)
