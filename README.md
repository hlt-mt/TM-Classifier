# TM-Classifier

This repository contains the software to run the Translation Memory domain classification service developed within the [CEF Data MarketPlace project](https://www.datamarketplace.eu). A service based on this tool is offered by the TAUS Data MarketPlace platform.

The goal of the tool is to provide a tag (or label) among a set of predefined 23 domain categories for a given Translation Unit (TU). This is obtained by running a software able to extract features from the source and target language sides of a TU and to take a decision about the most probable category the TU refers to. The source and target sentences in the TU may be provided in two different forms, either with their textual content or with the sentence embeddings (a tecnique to represent entire sentences and their semantic information as numerical vectors).


## The tool
The tool is based on two types of software packages: for sentences embeddings the embeddings provided by the [LASER suite](https://github.com/facebookresearch/LASER) are mainly utilized. For the classification step, a Multi Layer Perceptron Neural Network (MLP) was utilized using the [pytorch package](https://pytorch.org/).

It is worth noticing here that LASER is able to manage at least 93 language, giving the tool the ability to support multilinguality.

The tool is accessible by an API that allows a user to process a TU in both the forms. More details about the API specifications are available below.


## Installation and Usage

The first step is to download the Docker image of the code [image.domainclassification_service.tar.gz](https://drive.google.com/file/d/1kpbuIQpQW7Vdhql-AtGne9vDIPI_k1i6/view?usp=sharing) (around 2GB)

No specific hardware or software is required in addition to a working
"docker" installation (only the optional "email" functionality requires an email sending service running on the host)

Once the Docker image has been downloaded, it has to be added to your docker environment
```bash
$ docker load < image.domainclassification_service.tar.gz
```

To start the service, run the following command:
```bash
$ docker run --rm -it --net=host domainclassification_service
```

Then wait until the process prints the message
```bash
web service ready at port 8080 with rootDir /server/WWW
```
this means it is ready to accept requests.


Requests with TU represented with textual content can be issued at the following URLs:
* http://localhost:8080/classify_text
* http://${PUBLIC-IP}:8080//classify_text


### Example

The request
```bash
curl -X POST -F tu='en|Real Estate Development Inquiry investment project.|it|Progetto di investimento per indagine di sviluppo immobiliare.' http://localhost:8080/classify_text
```
produces the response:
```bash
{
 "status": 0,
 "payload": {'bestCategory': 'Construction_Real-Estate'}
}

```


## API specifications

[The API specs of the Domain Classification Service are available here](https://drive.google.com/file/d/1u5rvvycTKebB-8BhQ1Ex_kPsc-sFv-Zs/view?usp=sharing)

## Web GUI (Graphical User Interface)

To test the tool, a web graphical interface is made available in the Docker. It consists of a simple web page, where a TU can be inserted with its textual contents (both source and target sentences): then it can be submitted to the tool that returns the tag of the category classified as best. The GUI allows the user to provide an email address to which the output of the tool is sent. 


## How to build the docker image

In order to build the docker image, the steps are:
1. download the archive [setup_for_docker_build_DCS_image.tar.gz](https://drive.google.com/file/d/17yqjaxjFadsDemRGMCu8rKY9t6PGTN1h/view?usp=sharing)
2. extract the data from the archive
~~~
tar xvfz setup_for_docker_build_DCS_image.tar.gz
~~~
3. run the script DO_build_DCS_image.sh
~~~
bash DO_build_DCS_image.sh
~~~


## Credits

FBK developed the Domain Classification Service (the web service and the web GUI)


## Contacts

Please email cattoni AT fbk DOT eu




