# scan repositories

Scan repositories for existing CITATION.cff information

## Usage

``` r
scanRepos(repos)
```

## Arguments

- repos:

  character vector of repository urls or links to CITATION.cff files to
  be scanned

## Value

A list with CITATION.cff information collected from the provided
repositories

## See also

read_cff

## Author

Jan Philipp Dietrich

## Examples

``` r
scanRepos(c("https://github.com/magpiemodel/magpie",
            "https://github.com/remindmodel/remind"))
#> read in CITATION.cff for https://github.com/magpiemodel/magpie
#> read in CITATION.cff for https://github.com/remindmodel/remind
#> $`https://github.com/magpiemodel/magpie`
#> $`https://github.com/magpiemodel/magpie`$`cff-version`
#> [1] "1.0.3"
#> 
#> $`https://github.com/magpiemodel/magpie`$message
#> [1] "If you use this model, please cite it as below."
#> 
#> $`https://github.com/magpiemodel/magpie`$type
#> [1] "software"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors
#> $`https://github.com/magpiemodel/magpie`$authors[[1]]
#> $`https://github.com/magpiemodel/magpie`$authors[[1]]$`family-names`
#> [1] "Dietrich"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[1]]$`given-names`
#> [1] "Jan Philipp"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[1]]$orcid
#> [1] "https://orcid.org/0000-0002-4309-6431"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[1]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[1]]$email
#> [1] "dietrich@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[2]]
#> $`https://github.com/magpiemodel/magpie`$authors[[2]]$`family-names`
#> [1] "Bodirsky"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[2]]$`given-names`
#> [1] "Benjamin Leon"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[2]]$orcid
#> [1] "https://orcid.org/0000-0002-8242-6712"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[2]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[2]]$email
#> [1] "bodirsky@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[3]]
#> $`https://github.com/magpiemodel/magpie`$authors[[3]]$`family-names`
#> [1] "Weindl"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[3]]$`given-names`
#> [1] "Isabelle"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[3]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[3]]$email
#> [1] "weindl@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[4]]
#> $`https://github.com/magpiemodel/magpie`$authors[[4]]$`family-names`
#> [1] "Humpenöder"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[4]]$`given-names`
#> [1] "Florian"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[4]]$orcid
#> [1] "https://orcid.org/0000-0003-2927-9407"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[4]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[4]]$email
#> [1] "humpenoeder@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[5]]
#> $`https://github.com/magpiemodel/magpie`$authors[[5]]$`family-names`
#> [1] "Stevanovic"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[5]]$`given-names`
#> [1] "Miodrag"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[5]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[5]]$email
#> [1] "stevanovic@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[6]]
#> $`https://github.com/magpiemodel/magpie`$authors[[6]]$`family-names`
#> [1] "Kreidenweis"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[6]]$`given-names`
#> [1] "Ulrich"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[6]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[7]]
#> $`https://github.com/magpiemodel/magpie`$authors[[7]]$`family-names`
#> [1] "Wang"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[7]]$`given-names`
#> [1] "Xiaoxi"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[7]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[7]]$email
#> [1] "wang@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[8]]
#> $`https://github.com/magpiemodel/magpie`$authors[[8]]$`family-names`
#> [1] "Karstens"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[8]]$`given-names`
#> [1] "Kristine"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[8]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[8]]$email
#> [1] "karstens@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[9]]
#> $`https://github.com/magpiemodel/magpie`$authors[[9]]$`family-names`
#> [1] "Mishra"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[9]]$`given-names`
#> [1] "Abhijeet"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[9]]$orcid
#> [1] "https://orcid.org/0000-0002-8287-9922"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[9]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[9]]$email
#> [1] "mishra@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[10]]
#> $`https://github.com/magpiemodel/magpie`$authors[[10]]$`family-names`
#> [1] "Beier"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[10]]$`given-names`
#> [1] "Felicitas Dorothea"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[10]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[10]]$email
#> [1] "beier@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[11]]
#> $`https://github.com/magpiemodel/magpie`$authors[[11]]$`family-names`
#> [1] "Molina Bacca"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[11]]$`given-names`
#> [1] "Edna Johanna"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[11]]$orcid
#> [1] "https://orcid.org/0000-0001-6530-1849"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[11]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[11]]$email
#> [1] "mbacca@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[12]]
#> $`https://github.com/magpiemodel/magpie`$authors[[12]]$`family-names`
#> [1] "von Jeetze"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[12]]$`given-names`
#> [1] "Patrick"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[12]]$orcid
#> [1] "https://orcid.org/0000-0002-1197-4412"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[12]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[12]]$email
#> [1] "vjeetze@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[13]]
#> $`https://github.com/magpiemodel/magpie`$authors[[13]]$`family-names`
#> [1] "Windisch"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[13]]$`given-names`
#> [1] "Michael"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[13]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[13]]$email
#> [1] "windisch@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[14]]
#> $`https://github.com/magpiemodel/magpie`$authors[[14]]$`family-names`
#> [1] "Crawford"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[14]]$`given-names`
#> [1] "Michael Scott"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[14]]$orcid
#> [1] "https://orcid.org/0000-0003-1282-400X"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[14]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[14]]$email
#> [1] "crawford@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[15]]
#> $`https://github.com/magpiemodel/magpie`$authors[[15]]$`family-names`
#> [1] "Leip"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[15]]$`given-names`
#> [1] "Debbora"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[15]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[15]]$email
#> [1] "leip@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[16]]
#> $`https://github.com/magpiemodel/magpie`$authors[[16]]$`family-names`
#> [1] "Klein"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[16]]$`given-names`
#> [1] "David"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[16]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[16]]$email
#> [1] "dklein@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[17]]
#> $`https://github.com/magpiemodel/magpie`$authors[[17]]$`family-names`
#> [1] "Singh"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[17]]$`given-names`
#> [1] "Vartika"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[17]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[17]]$email
#> [1] "vasingh@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[18]]
#> $`https://github.com/magpiemodel/magpie`$authors[[18]]$`family-names`
#> [1] "Ambrósio"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[18]]$`given-names`
#> [1] "Geanderson"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[18]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[18]]$email
#> [1] "ambrosio@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[19]]
#> $`https://github.com/magpiemodel/magpie`$authors[[19]]$`family-names`
#> [1] "Araujo"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[19]]$`given-names`
#> [1] "Ewerton"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[19]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[19]]$email
#> [1] "araujo@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[20]]
#> $`https://github.com/magpiemodel/magpie`$authors[[20]]$`family-names`
#> [1] "Biewald"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[20]]$`given-names`
#> [1] "Anne"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[20]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[21]]
#> $`https://github.com/magpiemodel/magpie`$authors[[21]]$`family-names`
#> [1] "Sauer"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[21]]$`given-names`
#> [1] "Pascal"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[21]]$orcid
#> [1] "https://orcid.org/0000-0002-6856-8239"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[21]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[21]]$email
#> [1] "pascal.sauer@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[22]]
#> $`https://github.com/magpiemodel/magpie`$authors[[22]]$`family-names`
#> [1] "Köberle"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[22]]$`given-names`
#> [1] "Alexandre"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[22]]$orcid
#> [1] "https://orcid.org/0000-0003-0328-4750"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[22]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[22]]$email
#> [1] "alexkob@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[23]]
#> $`https://github.com/magpiemodel/magpie`$authors[[23]]$`family-names`
#> [1] "Steinhauser"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[23]]$`given-names`
#> [1] "Jan"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[23]]$orcid
#> [1] "https://orcid.org/0000-0002-5989-6855"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[23]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[23]]$email
#> [1] "janstein@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[24]]
#> $`https://github.com/magpiemodel/magpie`$authors[[24]]$`family-names`
#> [1] "Hötten"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[24]]$`given-names`
#> [1] "David"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[24]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[24]]$email
#> [1] "davidho@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[25]]
#> $`https://github.com/magpiemodel/magpie`$authors[[25]]$`family-names`
#> [1] "Schröter"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[25]]$`given-names`
#> [1] "Georg"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[25]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[25]]$email
#> [1] "georgsc@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[26]]
#> $`https://github.com/magpiemodel/magpie`$authors[[26]]$`family-names`
#> [1] "Rein"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[26]]$`given-names`
#> [1] "Patrick"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[26]]$orcid
#> [1] "https://orcid.org/0000-0001-9454-8381"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[26]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[26]]$email
#> [1] "patrick.rein@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[27]]
#> $`https://github.com/magpiemodel/magpie`$authors[[27]]$`family-names`
#> [1] "Lotze-Campen"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[27]]$`given-names`
#> [1] "Hermann"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[27]]$orcid
#> [1] "https://orcid.org/0000-0002-0003-5508"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[27]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[27]]$email
#> [1] "lotze-campen@pik-potsdam.de"
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[28]]
#> $`https://github.com/magpiemodel/magpie`$authors[[28]]$`family-names`
#> [1] "Popp"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[28]]$`given-names`
#> [1] "Alexander"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[28]]$orcid
#> [1] "https://orcid.org/0000-0001-9500-1986"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[28]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> $`https://github.com/magpiemodel/magpie`$authors[[28]]$email
#> [1] "popp@pik-potsdam.de"
#> 
#> 
#> 
#> $`https://github.com/magpiemodel/magpie`$title
#> [1] "MAgPIE - An Open Source land-use modeling framework"
#> 
#> $`https://github.com/magpiemodel/magpie`$abstract
#> [1] "The *Model of Agricultural Production and its Impact on the Environment* (MAgPIE) is a modular open source framework for modeling global land-systems, which is coupled to the grid-based dynamic vegetation model LPJmL, with a spatial resolution of 0.5degx0.5deg. It takes regional economic conditions such as demand for agricultural commodities, technological development and production costs as well as spatially explicit data on potential crop yields, land and water constraints (from LPJmL) into account. Based on these, the model derives specific land use patterns, yields and total costs of agricultural production for each grid cell. The objective function of the land use model is to minimize total cost of production for a given amount of regional food and bioenergy demand. Regional food energy demand is defined for an exogenously given population in 10 food energy categories, based on regional diets. Future trends in food demand are derived from a cross-country regression analysis, based on future scenarios on GDP and population growth."
#> 
#> $`https://github.com/magpiemodel/magpie`$version
#> [1] "4.14.0"
#> 
#> $`https://github.com/magpiemodel/magpie`$`date-released`
#> [1] "2026-05-05"
#> 
#> $`https://github.com/magpiemodel/magpie`$`repository-code`
#> [1] "https://github.com/magpiemodel/magpie"
#> 
#> $`https://github.com/magpiemodel/magpie`$keywords
#> [1] "landuse"             "modeling"            "model"              
#> [4] "nlp"                 "partial equilibrium"
#> 
#> $`https://github.com/magpiemodel/magpie`$doi
#> [1] "10.5281/zenodo.1418752"
#> 
#> $`https://github.com/magpiemodel/magpie`$license
#> [1] "AGPL-3.0-or-later"
#> 
#> $`https://github.com/magpiemodel/magpie`$url
#> [1] "https://github.com/magpiemodel/magpie"
#> 
#> 
#> $`https://github.com/remindmodel/remind`
#> $`https://github.com/remindmodel/remind`$`cff-version`
#> [1] "1.2.0"
#> 
#> $`https://github.com/remindmodel/remind`$message
#> [1] "If you use this model, please cite it as below."
#> 
#> $`https://github.com/remindmodel/remind`$type
#> [1] "software"
#> 
#> $`https://github.com/remindmodel/remind`$authors
#> $`https://github.com/remindmodel/remind`$authors[[1]]
#> $`https://github.com/remindmodel/remind`$authors[[1]]$`family-names`
#> [1] "Luderer"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[1]]$`given-names`
#> [1] "Gunnar"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[1]]$orcid
#> [1] "https://orcid.org/0000-0002-9057-6155"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[1]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[2]]
#> $`https://github.com/remindmodel/remind`$authors[[2]]$`family-names`
#> [1] "Bauer"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[2]]$`given-names`
#> [1] "Nico"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[2]]$orcid
#> [1] "https://orcid.org/0000-0002-0211-4162"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[2]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[3]]
#> $`https://github.com/remindmodel/remind`$authors[[3]]$`family-names`
#> [1] "Baumstark"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[3]]$`given-names`
#> [1] "Lavinia"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[3]]$orcid
#> [1] "https://orcid.org/0000-0002-6979-6671"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[3]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[4]]
#> $`https://github.com/remindmodel/remind`$authors[[4]]$`family-names`
#> [1] "Bertram"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[4]]$`given-names`
#> [1] "Christoph"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[4]]$orcid
#> [1] "https://orcid.org/0000-0002-0933-4395"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[4]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[5]]
#> $`https://github.com/remindmodel/remind`$authors[[5]]$`family-names`
#> [1] "Leimbach"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[5]]$`given-names`
#> [1] "Marian"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[5]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[6]]
#> $`https://github.com/remindmodel/remind`$authors[[6]]$`family-names`
#> [1] "Pietzcker"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[6]]$`given-names`
#> [1] "Robert"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[6]]$orcid
#> [1] "https://orcid.org/0000-0002-9403-6711"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[6]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[7]]
#> $`https://github.com/remindmodel/remind`$authors[[7]]$`family-names`
#> [1] "Strefler"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[7]]$`given-names`
#> [1] "Jessica"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[7]]$orcid
#> [1] "https://orcid.org/0000-0002-5279-4629"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[7]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[8]]
#> $`https://github.com/remindmodel/remind`$authors[[8]]$`family-names`
#> [1] "Aboumahboub"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[8]]$`given-names`
#> [1] "Tino"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[9]]
#> $`https://github.com/remindmodel/remind`$authors[[9]]$`family-names`
#> [1] "Abrahão"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[9]]$`given-names`
#> [1] "Gabriel"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[9]]$orcid
#> [1] "https://orcid.org/0000-0003-0336-6246"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[9]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[10]]
#> $`https://github.com/remindmodel/remind`$authors[[10]]$`family-names`
#> [1] "Auer"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[10]]$`given-names`
#> [1] "Cornelia"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[10]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[11]]
#> $`https://github.com/remindmodel/remind`$authors[[11]]$`family-names`
#> [1] "Bachorz"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[11]]$`given-names`
#> [1] "Clara"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[11]]$orcid
#> [1] "https://orcid.org/0000-0003-1638-4048"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[11]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[12]]
#> $`https://github.com/remindmodel/remind`$authors[[12]]$`family-names`
#> [1] "Bantje"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[12]]$`given-names`
#> [1] "David"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[12]]$orcid
#> [1] "https://orcid.org/0009-0005-8875-9496"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[12]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[13]]
#> $`https://github.com/remindmodel/remind`$authors[[13]]$`family-names`
#> [1] "Beier"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[13]]$`given-names`
#> [1] "Felicitas"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[13]]$orcid
#> [1] "https://orcid.org/0000-0002-8725-7663"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[13]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[14]]
#> $`https://github.com/remindmodel/remind`$authors[[14]]$`family-names`
#> [1] "Benke"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[14]]$`given-names`
#> [1] "Falk"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[14]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[15]]
#> $`https://github.com/remindmodel/remind`$authors[[15]]$`family-names`
#> [1] "Bi"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[15]]$`given-names`
#> [1] "Stephen"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[15]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[16]]
#> $`https://github.com/remindmodel/remind`$authors[[16]]$`family-names`
#> [1] "Dietrich"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[16]]$`given-names`
#> [1] "Jan Philipp"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[16]]$orcid
#> [1] "https://orcid.org/0000-0002-4309-6431"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[16]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[17]]
#> $`https://github.com/remindmodel/remind`$authors[[17]]$`family-names`
#> [1] "Dirnaichner"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[17]]$`given-names`
#> [1] "Alois"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[17]]$orcid
#> [1] "https://orcid.org/0000-0002-3240-2608"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[17]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[18]]
#> $`https://github.com/remindmodel/remind`$authors[[18]]$`family-names`
#> [1] "Dorndorf"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[18]]$`given-names`
#> [1] "Tabea"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[18]]$orcid
#> [1] "https://orcid.org/0000-0003-1824-898X"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[18]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[19]]
#> $`https://github.com/remindmodel/remind`$authors[[19]]$`family-names`
#> [1] "Duerrwaechter"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[19]]$`given-names`
#> [1] "Jakob"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[19]]$orcid
#> [1] "https://orcid.org/0000-0001-8961-5340"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[19]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[20]]
#> $`https://github.com/remindmodel/remind`$authors[[20]]$`family-names`
#> [1] "Fuchs"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[20]]$`given-names`
#> [1] "Sophie"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[20]]$orcid
#> [1] "https://orcid.org/0009-0000-7258-1287"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[20]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[21]]
#> $`https://github.com/remindmodel/remind`$authors[[21]]$`family-names`
#> [1] "Führlich"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[21]]$`given-names`
#> [1] "Pascal"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[21]]$orcid
#> [1] "https://orcid.org/0000-0002-6856-8239"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[21]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[22]]
#> $`https://github.com/remindmodel/remind`$authors[[22]]$`family-names`
#> [1] "Giannousakis"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[22]]$`given-names`
#> [1] "Anastasis"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[22]]$orcid
#> [1] "https://orcid.org/0000-0002-4225-0011"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[22]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[23]]
#> $`https://github.com/remindmodel/remind`$authors[[23]]$`family-names`
#> [1] "Gong"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[23]]$`given-names`
#> [1] "Chen Chris"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[23]]$orcid
#> [1] "https://orcid.org/0000-0002-6406-6266"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[23]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[24]]
#> $`https://github.com/remindmodel/remind`$authors[[24]]$`family-names`
#> [1] "Hagen"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[24]]$`given-names`
#> [1] "Alex"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[24]]$orcid
#> [1] "https://orcid.org/0000-0003-4793-8664"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[24]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[25]]
#> $`https://github.com/remindmodel/remind`$authors[[25]]$`family-names`
#> [1] "Haller"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[25]]$`given-names`
#> [1] "Markus"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[26]]
#> $`https://github.com/remindmodel/remind`$authors[[26]]$`family-names`
#> [1] "Hasse"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[26]]$`given-names`
#> [1] "Robin"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[26]]$orcid
#> [1] "https://orcid.org/0000-0003-1818-3186"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[26]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[27]]
#> $`https://github.com/remindmodel/remind`$authors[[27]]$`family-names`
#> [1] "Hayez"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[27]]$`given-names`
#> [1] "Léa"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[27]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[28]]
#> $`https://github.com/remindmodel/remind`$authors[[28]]$`family-names`
#> [1] "Hilaire"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[28]]$`given-names`
#> [1] "Jerome"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[28]]$orcid
#> [1] "https://orcid.org/0000-0002-9879-6339"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[28]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[29]]
#> $`https://github.com/remindmodel/remind`$authors[[29]]$`family-names`
#> [1] "Hofbauer"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[29]]$`given-names`
#> [1] "Verena"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[29]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[30]]
#> $`https://github.com/remindmodel/remind`$authors[[30]]$`family-names`
#> [1] "Hoppe"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[30]]$`given-names`
#> [1] "Johanna"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[30]]$orcid
#> [1] "https://orcid.org/0009-0004-6753-5090"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[30]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[31]]
#> $`https://github.com/remindmodel/remind`$authors[[31]]$`family-names`
#> [1] "Klein"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[31]]$`given-names`
#> [1] "David"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[31]]$orcid
#> [1] "https://orcid.org/0009-0001-7917-8041"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[31]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[32]]
#> $`https://github.com/remindmodel/remind`$authors[[32]]$`family-names`
#> [1] "Koch"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[32]]$`given-names`
#> [1] "Johannes"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[32]]$orcid
#> [1] "https://orcid.org/0000-0003-2920-8086"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[32]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[33]]
#> $`https://github.com/remindmodel/remind`$authors[[33]]$`family-names`
#> [1] "Köhler-Schindler"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[33]]$`given-names`
#> [1] "Laurin"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[33]]$orcid
#> [1] "https://orcid.org/0000-0003-4268-3084"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[33]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[34]]
#> $`https://github.com/remindmodel/remind`$authors[[34]]$`family-names`
#> [1] "Körner"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[34]]$`given-names`
#> [1] "Alexander"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[35]]
#> $`https://github.com/remindmodel/remind`$authors[[35]]$`family-names`
#> [1] "Kowalczyk"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[35]]$`given-names`
#> [1] "Katarzyna"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[35]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[36]]
#> $`https://github.com/remindmodel/remind`$authors[[36]]$`family-names`
#> [1] "Kriegler"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[36]]$`given-names`
#> [1] "Elmar"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[36]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[37]]
#> $`https://github.com/remindmodel/remind`$authors[[37]]$`family-names`
#> [1] "Lécuyer"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[37]]$`given-names`
#> [1] "Fabrice"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[37]]$orcid
#> [1] "https://orcid.org/0000-0002-7364-999X"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[37]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[38]]
#> $`https://github.com/remindmodel/remind`$authors[[38]]$`family-names`
#> [1] "Levesque"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[38]]$`given-names`
#> [1] "Antoine"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[38]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[39]]
#> $`https://github.com/remindmodel/remind`$authors[[39]]$`family-names`
#> [1] "Lorenz"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[39]]$`given-names`
#> [1] "Alexander"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[40]]
#> $`https://github.com/remindmodel/remind`$authors[[40]]$`family-names`
#> [1] "Ludig"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[40]]$`given-names`
#> [1] "Sylvie"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[41]]
#> $`https://github.com/remindmodel/remind`$authors[[41]]$`family-names`
#> [1] "Lüken"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[41]]$`given-names`
#> [1] "Michael"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[42]]
#> $`https://github.com/remindmodel/remind`$authors[[42]]$`family-names`
#> [1] "Malik"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[42]]$`given-names`
#> [1] "Aman"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[42]]$orcid
#> [1] "https://orcid.org/0000-0002-7310-8448"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[42]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[43]]
#> $`https://github.com/remindmodel/remind`$authors[[43]]$`family-names`
#> [1] "Mandaroux"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[43]]$`given-names`
#> [1] "Rahel"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[43]]$orcid
#> [1] "https://orcid.org/0000-0001-5596-2571"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[43]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[44]]
#> $`https://github.com/remindmodel/remind`$authors[[44]]$`family-names`
#> [1] "Manger"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[44]]$`given-names`
#> [1] "Susanne"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[45]]
#> $`https://github.com/remindmodel/remind`$authors[[45]]$`family-names`
#> [1] "Merfort"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[45]]$`given-names`
#> [1] "Anne"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[45]]$orcid
#> [1] "https://orcid.org/0000-0002-5929-7748"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[45]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[46]]
#> $`https://github.com/remindmodel/remind`$authors[[46]]$`family-names`
#> [1] "Merfort"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[46]]$`given-names`
#> [1] "Leon"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[46]]$orcid
#> [1] "https://orcid.org/0000-0003-1704-6892"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[46]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[47]]
#> $`https://github.com/remindmodel/remind`$authors[[47]]$`family-names`
#> [1] "Moreno-Leiva"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[47]]$`given-names`
#> [1] "Simón"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[47]]$orcid
#> [1] "https://orcid.org/0000-0002-9625-3955"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[47]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[48]]
#> $`https://github.com/remindmodel/remind`$authors[[48]]$`family-names`
#> [1] "Mouratiadou"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[48]]$`given-names`
#> [1] "Ioanna"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[49]]
#> $`https://github.com/remindmodel/remind`$authors[[49]]$`family-names`
#> [1] "Müßel"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[49]]$`given-names`
#> [1] "Jarusch"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[49]]$orcid
#> [1] "https://orcid.org/0000-0002-1857-7866"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[49]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[50]]
#> $`https://github.com/remindmodel/remind`$authors[[50]]$`family-names`
#> [1] "Odenweller"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[50]]$`given-names`
#> [1] "Adrian"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[50]]$orcid
#> [1] "https://orcid.org/0000-0002-1123-8124"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[50]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[51]]
#> $`https://github.com/remindmodel/remind`$authors[[51]]$`family-names`
#> [1] "Pehl"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[51]]$`given-names`
#> [1] "Michaja"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[51]]$orcid
#> [1] "https://orcid.org/0000-0003-2349-6515"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[51]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[52]]
#> $`https://github.com/remindmodel/remind`$authors[[52]]$`family-names`
#> [1] "Pflüger"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[52]]$`given-names`
#> [1] "Mika"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[52]]$orcid
#> [1] "https://orcid.org/0000-0002-7814-8916"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[52]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[53]]
#> $`https://github.com/remindmodel/remind`$authors[[53]]$`family-names`
#> [1] "Piontek"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[53]]$`given-names`
#> [1] "Franziska"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[53]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[54]]
#> $`https://github.com/remindmodel/remind`$authors[[54]]$`family-names`
#> [1] "Popin"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[54]]$`given-names`
#> [1] "Laura"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[55]]
#> $`https://github.com/remindmodel/remind`$authors[[55]]$`family-names`
#> [1] "Rauner"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[55]]$`given-names`
#> [1] "Sebastian"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[55]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[56]]
#> $`https://github.com/remindmodel/remind`$authors[[56]]$`family-names`
#> [1] "Richters"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[56]]$`given-names`
#> [1] "Oliver"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[56]]$orcid
#> [1] "https://orcid.org/0000-0001-8253-4716"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[56]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[57]]
#> $`https://github.com/remindmodel/remind`$authors[[57]]$`family-names`
#> [1] "Rodrigues"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[57]]$`given-names`
#> [1] "Renato"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[57]]$orcid
#> [1] "https://orcid.org/0000-0002-5863-5514"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[57]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[58]]
#> $`https://github.com/remindmodel/remind`$authors[[58]]$`family-names`
#> [1] "Roming"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[58]]$`given-names`
#> [1] "Niklas"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[59]]
#> $`https://github.com/remindmodel/remind`$authors[[59]]$`family-names`
#> [1] "Rosemann"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[59]]$`given-names`
#> [1] "Ricarda"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[59]]$orcid
#> [1] "https://orcid.org/0009-0006-5939-3197"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[59]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[60]]
#> $`https://github.com/remindmodel/remind`$authors[[60]]$`family-names`
#> [1] "Rottoli"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[60]]$`given-names`
#> [1] "Marianna"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[60]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[61]]
#> $`https://github.com/remindmodel/remind`$authors[[61]]$`family-names`
#> [1] "Rüter"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[61]]$`given-names`
#> [1] "Tonn"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[61]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[62]]
#> $`https://github.com/remindmodel/remind`$authors[[62]]$`family-names`
#> [1] "Salzwedel"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[62]]$`given-names`
#> [1] "Robert"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[62]]$orcid
#> [1] "https://orcid.org/0000-0002-7614-9210"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[62]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[63]]
#> $`https://github.com/remindmodel/remind`$authors[[63]]$`family-names`
#> [1] "Sauer"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[63]]$`given-names`
#> [1] "Pascal"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[63]]$orcid
#> [1] "https://orcid.org/0000-0002-6856-8239"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[63]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[64]]
#> $`https://github.com/remindmodel/remind`$authors[[64]]$`family-names`
#> [1] "Schmidt"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[64]]$`given-names`
#> [1] "Eva"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[65]]
#> $`https://github.com/remindmodel/remind`$authors[[65]]$`family-names`
#> [1] "Schötz"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[65]]$`given-names`
#> [1] "Christof"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[65]]$orcid
#> [1] "https://orcid.org/0000-0003-3528-4544"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[65]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[66]]
#> $`https://github.com/remindmodel/remind`$authors[[66]]$`family-names`
#> [1] "Schreyer"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[66]]$`given-names`
#> [1] "Felix"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[66]]$orcid
#> [1] "https://orcid.org/0000-0003-0376-2599"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[66]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[67]]
#> $`https://github.com/remindmodel/remind`$authors[[67]]$`family-names`
#> [1] "Schultes"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[67]]$`given-names`
#> [1] "Anselm"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[67]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[68]]
#> $`https://github.com/remindmodel/remind`$authors[[68]]$`family-names`
#> [1] "Sitarz"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[68]]$`given-names`
#> [1] "Joanna"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[68]]$orcid
#> [1] "https://orcid.org/0000-0002-8060-1097"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[68]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[69]]
#> $`https://github.com/remindmodel/remind`$authors[[69]]$`family-names`
#> [1] "Sörgel"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[69]]$`given-names`
#> [1] "Björn"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[69]]$orcid
#> [1] "https://orcid.org/0000-0002-2630-7081"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[69]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[70]]
#> $`https://github.com/remindmodel/remind`$authors[[70]]$`family-names`
#> [1] "Ueckerdt"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[70]]$`given-names`
#> [1] "Falko"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[70]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[71]]
#> $`https://github.com/remindmodel/remind`$authors[[71]]$`family-names`
#> [1] "Verpoort"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[71]]$`given-names`
#> [1] "Philipp"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[71]]$orcid
#> [1] "https://orcid.org/0000-0003-1319-5006"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[71]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[72]]
#> $`https://github.com/remindmodel/remind`$authors[[72]]$`family-names`
#> [1] "Weigmann"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[72]]$`given-names`
#> [1] "Pascal"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[72]]$orcid
#> [1] "https://orcid.org/0000-0001-8801-173X"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[72]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> $`https://github.com/remindmodel/remind`$authors[[73]]
#> $`https://github.com/remindmodel/remind`$authors[[73]]$`family-names`
#> [1] "Weiss"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[73]]$`given-names`
#> [1] "Bennet"
#> 
#> $`https://github.com/remindmodel/remind`$authors[[73]]$affiliation
#> [1] "Potsdam Institute for Climate Impact Research"
#> 
#> 
#> 
#> $`https://github.com/remindmodel/remind`$title
#> [1] "REMIND - REgional Model of INvestments and Development"
#> 
#> $`https://github.com/remindmodel/remind`$abstract
#> [1] "REMIND (REgional Model of Investment and Development) is a numerical open source model that represents the future evolution of the world economies with a special focus on the development of the energy sector and the implications for our world climate. The goal of REMIND is to find the optimal mix of investments in the economy and the energy sectors of each model region given a set of population, technology, policy and climate constraints. It also accounts for regional trade characteristics on goods, energy fuels, and emissions allowances. All greenhouse gas emissions due to human activities are represented in the model."
#> 
#> $`https://github.com/remindmodel/remind`$version
#> [1] "3.6.0.dev474"
#> 
#> $`https://github.com/remindmodel/remind`$`date-released`
#> [1] "2026-07-07"
#> 
#> $`https://github.com/remindmodel/remind`$`repository-code`
#> [1] "https://github.com/remindmodel/remind"
#> 
#> $`https://github.com/remindmodel/remind`$keywords
#> [1] "energy"             "economy"            "modeling"          
#> [4] "model"              "active-development"
#> 
#> $`https://github.com/remindmodel/remind`$license
#> [1] "AGPL-3.0-or-later"
#> 
#> $`https://github.com/remindmodel/remind`$url
#> [1] "https://www.pik-potsdam.de/research/transformation-pathways/models/remind"
#> 
#> 
```
