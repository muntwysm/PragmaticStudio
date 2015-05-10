
require_relative 'project_catalogue'





project_Catalogue_Chris = ProjectCatalogue.new ('chris projects')

project_chris_house = Project.new('Christopher House', 0, 2_000_000)
project_PC_Upgrades = Project.new('PCUpgrades',500,65000)
project_Office_Additions = Project.new('office additions',500,40000)

project_Catalogue_Chris.add_project(project_chris_house)
project_Catalogue_Chris.add_project(project_PC_Upgrades)
project_Catalogue_Chris.add_project(project_Office_Additions)

project_Catalogue_Chris.request_funding(3)
