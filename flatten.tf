// Ensure that at the deepest level, there are no more child modules
module "assert_no_more_children" {
  source        = "Invicton-Labs/assertion/null"
  version       = "0.2.1"
  condition     = length(local.final_child.child_modules) == 0
  error_message = "Too many module levels: the Invicton-Labs/get-state/null module does not support states that have modules more than 200 levels deep."
}

locals {
  final_child = local.child_200
  child_1 = {
    resources = [
      for resource in lookup(local.root_module, "resources", []) :
      {
        module_address = ""
        resource       = resource
      }
    ]
    child_modules = lookup(local.root_module, "child_modules", [])
  }

  child_2 = {
    resources = concat(local.child_1.resources, [
      for module in local.child_1.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_1.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_3 = {
    resources = concat(local.child_2.resources, [
      for module in local.child_2.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_2.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_4 = {
    resources = concat(local.child_3.resources, [
      for module in local.child_3.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_3.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_5 = {
    resources = concat(local.child_4.resources, [
      for module in local.child_4.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_4.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_6 = {
    resources = concat(local.child_5.resources, [
      for module in local.child_5.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_5.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_7 = {
    resources = concat(local.child_6.resources, [
      for module in local.child_6.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_6.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_8 = {
    resources = concat(local.child_7.resources, [
      for module in local.child_7.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_7.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_9 = {
    resources = concat(local.child_8.resources, [
      for module in local.child_8.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_8.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_10 = {
    resources = concat(local.child_9.resources, [
      for module in local.child_9.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_9.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_11 = {
    resources = concat(local.child_10.resources, [
      for module in local.child_10.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_10.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_12 = {
    resources = concat(local.child_11.resources, [
      for module in local.child_11.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_11.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_13 = {
    resources = concat(local.child_12.resources, [
      for module in local.child_12.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_12.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_14 = {
    resources = concat(local.child_13.resources, [
      for module in local.child_13.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_13.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_15 = {
    resources = concat(local.child_14.resources, [
      for module in local.child_14.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_14.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_16 = {
    resources = concat(local.child_15.resources, [
      for module in local.child_15.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_15.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_17 = {
    resources = concat(local.child_16.resources, [
      for module in local.child_16.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_16.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_18 = {
    resources = concat(local.child_17.resources, [
      for module in local.child_17.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_17.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_19 = {
    resources = concat(local.child_18.resources, [
      for module in local.child_18.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_18.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_20 = {
    resources = concat(local.child_19.resources, [
      for module in local.child_19.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_19.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_21 = {
    resources = concat(local.child_20.resources, [
      for module in local.child_20.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_20.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_22 = {
    resources = concat(local.child_21.resources, [
      for module in local.child_21.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_21.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_23 = {
    resources = concat(local.child_22.resources, [
      for module in local.child_22.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_22.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_24 = {
    resources = concat(local.child_23.resources, [
      for module in local.child_23.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_23.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_25 = {
    resources = concat(local.child_24.resources, [
      for module in local.child_24.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_24.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_26 = {
    resources = concat(local.child_25.resources, [
      for module in local.child_25.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_25.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_27 = {
    resources = concat(local.child_26.resources, [
      for module in local.child_26.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_26.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_28 = {
    resources = concat(local.child_27.resources, [
      for module in local.child_27.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_27.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_29 = {
    resources = concat(local.child_28.resources, [
      for module in local.child_28.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_28.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_30 = {
    resources = concat(local.child_29.resources, [
      for module in local.child_29.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_29.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_31 = {
    resources = concat(local.child_30.resources, [
      for module in local.child_30.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_30.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_32 = {
    resources = concat(local.child_31.resources, [
      for module in local.child_31.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_31.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_33 = {
    resources = concat(local.child_32.resources, [
      for module in local.child_32.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_32.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_34 = {
    resources = concat(local.child_33.resources, [
      for module in local.child_33.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_33.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_35 = {
    resources = concat(local.child_34.resources, [
      for module in local.child_34.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_34.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_36 = {
    resources = concat(local.child_35.resources, [
      for module in local.child_35.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_35.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_37 = {
    resources = concat(local.child_36.resources, [
      for module in local.child_36.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_36.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_38 = {
    resources = concat(local.child_37.resources, [
      for module in local.child_37.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_37.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_39 = {
    resources = concat(local.child_38.resources, [
      for module in local.child_38.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_38.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_40 = {
    resources = concat(local.child_39.resources, [
      for module in local.child_39.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_39.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_41 = {
    resources = concat(local.child_40.resources, [
      for module in local.child_40.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_40.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_42 = {
    resources = concat(local.child_41.resources, [
      for module in local.child_41.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_41.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_43 = {
    resources = concat(local.child_42.resources, [
      for module in local.child_42.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_42.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_44 = {
    resources = concat(local.child_43.resources, [
      for module in local.child_43.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_43.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_45 = {
    resources = concat(local.child_44.resources, [
      for module in local.child_44.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_44.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_46 = {
    resources = concat(local.child_45.resources, [
      for module in local.child_45.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_45.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_47 = {
    resources = concat(local.child_46.resources, [
      for module in local.child_46.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_46.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_48 = {
    resources = concat(local.child_47.resources, [
      for module in local.child_47.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_47.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_49 = {
    resources = concat(local.child_48.resources, [
      for module in local.child_48.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_48.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_50 = {
    resources = concat(local.child_49.resources, [
      for module in local.child_49.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_49.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_51 = {
    resources = concat(local.child_50.resources, [
      for module in local.child_50.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_50.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_52 = {
    resources = concat(local.child_51.resources, [
      for module in local.child_51.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_51.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_53 = {
    resources = concat(local.child_52.resources, [
      for module in local.child_52.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_52.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_54 = {
    resources = concat(local.child_53.resources, [
      for module in local.child_53.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_53.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_55 = {
    resources = concat(local.child_54.resources, [
      for module in local.child_54.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_54.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_56 = {
    resources = concat(local.child_55.resources, [
      for module in local.child_55.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_55.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_57 = {
    resources = concat(local.child_56.resources, [
      for module in local.child_56.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_56.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_58 = {
    resources = concat(local.child_57.resources, [
      for module in local.child_57.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_57.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_59 = {
    resources = concat(local.child_58.resources, [
      for module in local.child_58.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_58.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_60 = {
    resources = concat(local.child_59.resources, [
      for module in local.child_59.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_59.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_61 = {
    resources = concat(local.child_60.resources, [
      for module in local.child_60.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_60.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_62 = {
    resources = concat(local.child_61.resources, [
      for module in local.child_61.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_61.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_63 = {
    resources = concat(local.child_62.resources, [
      for module in local.child_62.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_62.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_64 = {
    resources = concat(local.child_63.resources, [
      for module in local.child_63.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_63.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_65 = {
    resources = concat(local.child_64.resources, [
      for module in local.child_64.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_64.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_66 = {
    resources = concat(local.child_65.resources, [
      for module in local.child_65.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_65.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_67 = {
    resources = concat(local.child_66.resources, [
      for module in local.child_66.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_66.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_68 = {
    resources = concat(local.child_67.resources, [
      for module in local.child_67.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_67.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_69 = {
    resources = concat(local.child_68.resources, [
      for module in local.child_68.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_68.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_70 = {
    resources = concat(local.child_69.resources, [
      for module in local.child_69.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_69.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_71 = {
    resources = concat(local.child_70.resources, [
      for module in local.child_70.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_70.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_72 = {
    resources = concat(local.child_71.resources, [
      for module in local.child_71.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_71.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_73 = {
    resources = concat(local.child_72.resources, [
      for module in local.child_72.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_72.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_74 = {
    resources = concat(local.child_73.resources, [
      for module in local.child_73.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_73.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_75 = {
    resources = concat(local.child_74.resources, [
      for module in local.child_74.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_74.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_76 = {
    resources = concat(local.child_75.resources, [
      for module in local.child_75.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_75.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_77 = {
    resources = concat(local.child_76.resources, [
      for module in local.child_76.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_76.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_78 = {
    resources = concat(local.child_77.resources, [
      for module in local.child_77.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_77.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_79 = {
    resources = concat(local.child_78.resources, [
      for module in local.child_78.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_78.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_80 = {
    resources = concat(local.child_79.resources, [
      for module in local.child_79.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_79.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_81 = {
    resources = concat(local.child_80.resources, [
      for module in local.child_80.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_80.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_82 = {
    resources = concat(local.child_81.resources, [
      for module in local.child_81.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_81.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_83 = {
    resources = concat(local.child_82.resources, [
      for module in local.child_82.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_82.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_84 = {
    resources = concat(local.child_83.resources, [
      for module in local.child_83.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_83.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_85 = {
    resources = concat(local.child_84.resources, [
      for module in local.child_84.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_84.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_86 = {
    resources = concat(local.child_85.resources, [
      for module in local.child_85.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_85.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_87 = {
    resources = concat(local.child_86.resources, [
      for module in local.child_86.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_86.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_88 = {
    resources = concat(local.child_87.resources, [
      for module in local.child_87.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_87.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_89 = {
    resources = concat(local.child_88.resources, [
      for module in local.child_88.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_88.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_90 = {
    resources = concat(local.child_89.resources, [
      for module in local.child_89.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_89.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_91 = {
    resources = concat(local.child_90.resources, [
      for module in local.child_90.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_90.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_92 = {
    resources = concat(local.child_91.resources, [
      for module in local.child_91.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_91.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_93 = {
    resources = concat(local.child_92.resources, [
      for module in local.child_92.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_92.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_94 = {
    resources = concat(local.child_93.resources, [
      for module in local.child_93.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_93.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_95 = {
    resources = concat(local.child_94.resources, [
      for module in local.child_94.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_94.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_96 = {
    resources = concat(local.child_95.resources, [
      for module in local.child_95.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_95.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_97 = {
    resources = concat(local.child_96.resources, [
      for module in local.child_96.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_96.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_98 = {
    resources = concat(local.child_97.resources, [
      for module in local.child_97.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_97.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_99 = {
    resources = concat(local.child_98.resources, [
      for module in local.child_98.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_98.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_100 = {
    resources = concat(local.child_99.resources, [
      for module in local.child_99.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_99.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_101 = {
    resources = concat(local.child_100.resources, [
      for module in local.child_100.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_100.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_102 = {
    resources = concat(local.child_101.resources, [
      for module in local.child_101.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_101.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_103 = {
    resources = concat(local.child_102.resources, [
      for module in local.child_102.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_102.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_104 = {
    resources = concat(local.child_103.resources, [
      for module in local.child_103.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_103.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_105 = {
    resources = concat(local.child_104.resources, [
      for module in local.child_104.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_104.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_106 = {
    resources = concat(local.child_105.resources, [
      for module in local.child_105.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_105.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_107 = {
    resources = concat(local.child_106.resources, [
      for module in local.child_106.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_106.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_108 = {
    resources = concat(local.child_107.resources, [
      for module in local.child_107.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_107.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_109 = {
    resources = concat(local.child_108.resources, [
      for module in local.child_108.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_108.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_110 = {
    resources = concat(local.child_109.resources, [
      for module in local.child_109.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_109.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_111 = {
    resources = concat(local.child_110.resources, [
      for module in local.child_110.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_110.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_112 = {
    resources = concat(local.child_111.resources, [
      for module in local.child_111.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_111.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_113 = {
    resources = concat(local.child_112.resources, [
      for module in local.child_112.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_112.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_114 = {
    resources = concat(local.child_113.resources, [
      for module in local.child_113.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_113.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_115 = {
    resources = concat(local.child_114.resources, [
      for module in local.child_114.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_114.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_116 = {
    resources = concat(local.child_115.resources, [
      for module in local.child_115.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_115.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_117 = {
    resources = concat(local.child_116.resources, [
      for module in local.child_116.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_116.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_118 = {
    resources = concat(local.child_117.resources, [
      for module in local.child_117.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_117.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_119 = {
    resources = concat(local.child_118.resources, [
      for module in local.child_118.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_118.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_120 = {
    resources = concat(local.child_119.resources, [
      for module in local.child_119.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_119.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_121 = {
    resources = concat(local.child_120.resources, [
      for module in local.child_120.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_120.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_122 = {
    resources = concat(local.child_121.resources, [
      for module in local.child_121.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_121.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_123 = {
    resources = concat(local.child_122.resources, [
      for module in local.child_122.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_122.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_124 = {
    resources = concat(local.child_123.resources, [
      for module in local.child_123.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_123.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_125 = {
    resources = concat(local.child_124.resources, [
      for module in local.child_124.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_124.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_126 = {
    resources = concat(local.child_125.resources, [
      for module in local.child_125.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_125.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_127 = {
    resources = concat(local.child_126.resources, [
      for module in local.child_126.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_126.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_128 = {
    resources = concat(local.child_127.resources, [
      for module in local.child_127.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_127.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_129 = {
    resources = concat(local.child_128.resources, [
      for module in local.child_128.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_128.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_130 = {
    resources = concat(local.child_129.resources, [
      for module in local.child_129.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_129.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_131 = {
    resources = concat(local.child_130.resources, [
      for module in local.child_130.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_130.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_132 = {
    resources = concat(local.child_131.resources, [
      for module in local.child_131.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_131.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_133 = {
    resources = concat(local.child_132.resources, [
      for module in local.child_132.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_132.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_134 = {
    resources = concat(local.child_133.resources, [
      for module in local.child_133.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_133.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_135 = {
    resources = concat(local.child_134.resources, [
      for module in local.child_134.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_134.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_136 = {
    resources = concat(local.child_135.resources, [
      for module in local.child_135.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_135.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_137 = {
    resources = concat(local.child_136.resources, [
      for module in local.child_136.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_136.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_138 = {
    resources = concat(local.child_137.resources, [
      for module in local.child_137.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_137.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_139 = {
    resources = concat(local.child_138.resources, [
      for module in local.child_138.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_138.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_140 = {
    resources = concat(local.child_139.resources, [
      for module in local.child_139.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_139.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_141 = {
    resources = concat(local.child_140.resources, [
      for module in local.child_140.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_140.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_142 = {
    resources = concat(local.child_141.resources, [
      for module in local.child_141.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_141.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_143 = {
    resources = concat(local.child_142.resources, [
      for module in local.child_142.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_142.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_144 = {
    resources = concat(local.child_143.resources, [
      for module in local.child_143.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_143.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_145 = {
    resources = concat(local.child_144.resources, [
      for module in local.child_144.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_144.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_146 = {
    resources = concat(local.child_145.resources, [
      for module in local.child_145.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_145.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_147 = {
    resources = concat(local.child_146.resources, [
      for module in local.child_146.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_146.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_148 = {
    resources = concat(local.child_147.resources, [
      for module in local.child_147.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_147.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_149 = {
    resources = concat(local.child_148.resources, [
      for module in local.child_148.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_148.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_150 = {
    resources = concat(local.child_149.resources, [
      for module in local.child_149.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_149.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_151 = {
    resources = concat(local.child_150.resources, [
      for module in local.child_150.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_150.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_152 = {
    resources = concat(local.child_151.resources, [
      for module in local.child_151.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_151.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_153 = {
    resources = concat(local.child_152.resources, [
      for module in local.child_152.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_152.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_154 = {
    resources = concat(local.child_153.resources, [
      for module in local.child_153.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_153.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_155 = {
    resources = concat(local.child_154.resources, [
      for module in local.child_154.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_154.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_156 = {
    resources = concat(local.child_155.resources, [
      for module in local.child_155.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_155.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_157 = {
    resources = concat(local.child_156.resources, [
      for module in local.child_156.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_156.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_158 = {
    resources = concat(local.child_157.resources, [
      for module in local.child_157.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_157.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_159 = {
    resources = concat(local.child_158.resources, [
      for module in local.child_158.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_158.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_160 = {
    resources = concat(local.child_159.resources, [
      for module in local.child_159.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_159.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_161 = {
    resources = concat(local.child_160.resources, [
      for module in local.child_160.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_160.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_162 = {
    resources = concat(local.child_161.resources, [
      for module in local.child_161.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_161.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_163 = {
    resources = concat(local.child_162.resources, [
      for module in local.child_162.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_162.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_164 = {
    resources = concat(local.child_163.resources, [
      for module in local.child_163.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_163.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_165 = {
    resources = concat(local.child_164.resources, [
      for module in local.child_164.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_164.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_166 = {
    resources = concat(local.child_165.resources, [
      for module in local.child_165.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_165.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_167 = {
    resources = concat(local.child_166.resources, [
      for module in local.child_166.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_166.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_168 = {
    resources = concat(local.child_167.resources, [
      for module in local.child_167.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_167.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_169 = {
    resources = concat(local.child_168.resources, [
      for module in local.child_168.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_168.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_170 = {
    resources = concat(local.child_169.resources, [
      for module in local.child_169.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_169.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_171 = {
    resources = concat(local.child_170.resources, [
      for module in local.child_170.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_170.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_172 = {
    resources = concat(local.child_171.resources, [
      for module in local.child_171.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_171.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_173 = {
    resources = concat(local.child_172.resources, [
      for module in local.child_172.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_172.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_174 = {
    resources = concat(local.child_173.resources, [
      for module in local.child_173.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_173.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_175 = {
    resources = concat(local.child_174.resources, [
      for module in local.child_174.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_174.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_176 = {
    resources = concat(local.child_175.resources, [
      for module in local.child_175.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_175.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_177 = {
    resources = concat(local.child_176.resources, [
      for module in local.child_176.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_176.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_178 = {
    resources = concat(local.child_177.resources, [
      for module in local.child_177.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_177.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_179 = {
    resources = concat(local.child_178.resources, [
      for module in local.child_178.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_178.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_180 = {
    resources = concat(local.child_179.resources, [
      for module in local.child_179.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_179.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_181 = {
    resources = concat(local.child_180.resources, [
      for module in local.child_180.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_180.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_182 = {
    resources = concat(local.child_181.resources, [
      for module in local.child_181.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_181.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_183 = {
    resources = concat(local.child_182.resources, [
      for module in local.child_182.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_182.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_184 = {
    resources = concat(local.child_183.resources, [
      for module in local.child_183.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_183.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_185 = {
    resources = concat(local.child_184.resources, [
      for module in local.child_184.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_184.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_186 = {
    resources = concat(local.child_185.resources, [
      for module in local.child_185.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_185.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_187 = {
    resources = concat(local.child_186.resources, [
      for module in local.child_186.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_186.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_188 = {
    resources = concat(local.child_187.resources, [
      for module in local.child_187.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_187.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_189 = {
    resources = concat(local.child_188.resources, [
      for module in local.child_188.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_188.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_190 = {
    resources = concat(local.child_189.resources, [
      for module in local.child_189.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_189.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_191 = {
    resources = concat(local.child_190.resources, [
      for module in local.child_190.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_190.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_192 = {
    resources = concat(local.child_191.resources, [
      for module in local.child_191.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_191.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_193 = {
    resources = concat(local.child_192.resources, [
      for module in local.child_192.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_192.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_194 = {
    resources = concat(local.child_193.resources, [
      for module in local.child_193.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_193.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_195 = {
    resources = concat(local.child_194.resources, [
      for module in local.child_194.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_194.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_196 = {
    resources = concat(local.child_195.resources, [
      for module in local.child_195.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_195.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_197 = {
    resources = concat(local.child_196.resources, [
      for module in local.child_196.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_196.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_198 = {
    resources = concat(local.child_197.resources, [
      for module in local.child_197.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_197.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_199 = {
    resources = concat(local.child_198.resources, [
      for module in local.child_198.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_198.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }
  child_200 = {
    resources = concat(local.child_199.resources, [
      for module in local.child_199.child_modules :
      [
        for resource in lookup(module, "resources", []) :
        {
          module_address = module.address
          resource       = resource
        }
      ]
    ]...)
    child_modules = concat([], [
      for module in local.child_199.child_modules :
      lookup(module, "child_modules", [])
    ]...)
  }  
}
