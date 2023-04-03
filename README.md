
# Domain Adaptation for Egocentric-Action-Recognition

## Introduction
This is the repository for the Machine Learning and Deep learning project at PoliTO. that aims at assessing the performance of applying the TA3N architecture into an Adapting Feature Norm (AFN) framework. Moreover, an ablation study on the components of TA3N is performed to understand the effectiveness of the domain alignment solutions adopted in this deep learning model. This project is the result of a collaboration with https://github.com/Terdis and https://github.com/MatteoBerta.

![TA3N_architecture](https://user-images.githubusercontent.com/104196258/229546440-10a86381-6961-4af8-8386-0166031ff323.png)


## Aim of the project
Egocentric ASction Recognition is the task of classifying actions performed in first person videos. The goal of this project is to perform domain adaptation for this task and, in particular, to assess the performance of the TA3N architecture and improve the state of the art.
In this project we worked with the EPIC kitchens dataset which is composed of recordings of culinary activities and in which the actions to be recognized are composed of a verb and a noun. Common examples of these activities are "cut onion", "wash dishes" or "close fridge".


## TA3N architecture
The architecture on which the project is built is TA3N, which stands for Temporal Attentive Adversarial Adapatation Network. It is a quite complex architecture built upon three main components: 
1. Baseline: composed of a pretrained ResNet and a Temporal Module. The ResNet is used to collect the features from the video's frames, the Temporal Module serves the purpose of finding correlations between different frames (useful to distinguish betweeen similar actions such as "open fridge" and "close fridge").
2. Domain Discriminators: used to extract features that are discriminative with respect to the domain in which they have been collected.
3. Domain Attention Block:

## Our Improvement
We replicated the results of the original TA3N paper and we implemented the same architecture into an Adaptive Feature Norm (AFN) framework. As shown in 
[this paper](https://arxiv.org/pdf/1811.07456.pdf), features' norms may significantly affect the model's ability to perform action classification. With AFN, the extracted features lie in a space in which the actions they represent are easier to separate. 

## Original Papers

| Paper | Title | GitHub Repository |
| ----- | ----- | --------------------- |
| [1907.12743](https://arxiv.org/abs/1907.12743) | Temporal Attentive Alignment for Large-Scale Video Domain Adaptation | [TA3N Repository](https://github.com/jonmun/EPIC-KITCHENS-100_UDA_TA3N) |
| [1811.07456](https://arxiv.org/pdf/1811.07456.pdf) | Larger Norm More Transferable: An Adaptive Feature Norm Approach for Unsupervised Domain Adaptation. | [AFN Repository](https://github.com/jihanyang/AFN) |
