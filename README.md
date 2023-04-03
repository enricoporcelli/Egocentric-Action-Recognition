
# Domain Adaptation for Egocentric-Action-Recognition

## Introduction
This is the repository for the Machine Learning and Deep learning project at PoliTo, which is the result of a collaboration with [Umberto Fontana](https://github.com/Terdis) and [Matteo Berta](https://github.com/MatteoBerta).

<p align="center"><img src="https://user-images.githubusercontent.com/104196258/229546440-10a86381-6961-4af8-8386-0166031ff323.png" width="700">



## Aim of the project
Egocentric ASction Recognition is the task of classifying actions performed in first person videos. The goal of this project is to perform domain adaptation for this task and, in particular, to assess the performance of the TA3N and improve its performance.
In this project we worked with the [EPIC-KITCHENS-100](https://epic-kitchens.github.io/2023) dataset which is composed of recordings of culinary activities and in which the actions to be recognized are composed of a verb and a noun. Common examples of these activities are "cut onion", "wash dishes" or "close fridge". The dataset is subdivided in three domains which are represented by videos recorded in three different kitchens

## TA3N architecture
The architecture on which the project is built is TA3N, which stands for Temporal Attentive Adversarial Adapatation Network. It is a quite complex architecture built upon three main components: 
1. Baseline: composed of a pretrained ResNet and a Temporal Module. The ResNet is used to collect the features from the video's frames, the Temporal Module serves the purpose of finding correlations between different frames (useful to distinguish betweeen similar actions such as "open fridge" and "close fridge").
2. Domain Discriminators: used to reward the network when the extract features are similar between domains, thus favouring domain adaptation.
3. Domain Attention Block: it is implemented inside the Temporal Module and it applies a discriminator on each temporal feature to compute Domain Attention scores for each of them.

## Our Improvement
We replicated the results of the original TA3N paper and we performed an ablation study to understand the impact of the Domain Discriminators and of the Domain Attention Block in the domain adaptation task. We also implemented the same architecture into an Adaptive Feature Norm (AFN) framework. As shown in 
[this paper](https://arxiv.org/pdf/1811.07456.pdf), features' norms may significantly affect the model's ability to perform action classification. With AFN, the extracted features lie in a space in which they are easier to separate. 

## Original Papers

| Paper | Title | GitHub Repository |
| ----- | ----- | --------------------- |
| [1907.12743](https://arxiv.org/abs/1907.12743) | Temporal Attentive Alignment for Large-Scale Video Domain Adaptation | [TA3N Repository](https://github.com/jonmun/EPIC-KITCHENS-100_UDA_TA3N) |
| [1811.07456](https://arxiv.org/pdf/1811.07456.pdf) | Larger Norm More Transferable: An Adaptive Feature Norm Approach for Unsupervised Domain Adaptation. | [AFN Repository](https://github.com/jihanyang/AFN) | 
