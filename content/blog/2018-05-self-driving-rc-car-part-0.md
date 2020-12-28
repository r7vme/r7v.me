+++
date = "2018-05-24"
title = "Self-driving RC Car. Part 0: How I Started With Machine Learning"
+++

I had no idea about machine learning at all. Most of the “stackoverflow” answers were like “Pick up some existing framework and do hello world examples”, which does not makes any sense for me at all. Tons of frameworks, tons of ML libraries, tons of ML algorithms and you are sitting with your “hello world” [Keras](https://keras.io/) script 20 lines long like “OK, i’m data scientist now”. Imo you need to have at least some idea how it works under the hood. But it’s not black and white of course. Having a “real world” problem to solve one of the keys to success, not only theory. Moreover problem must be solved by someone else. In my case, it was a prototype of RC car capable to self-drive between two lines. I did a quick research and fortunately there were multiple projects that solved this problem and provided decent documentation. I’ve decided to try build a [donkeycar](http://www.donkeycar.com/).

# Step 0: Spending money

What you do when you already excited about something? Of course you need to spend money first, otherwise it will tooo boring. Ok, i’ve spend around 350 Euros to buy [all hardware](http://docs.donkeycar.com/guide/build_hardware/) and additional tools. Then i assembled it all together. My aim was to drive the car from laptop. This was easy.

![](/img/2018/donkeycar1.jpg)

# Step 1: Theory and Practice

Donkey car has [really good documentation](https://docs.donkeycar.com/) (thanks to community), so first i made a try to collect a data and train first model. It was expected failure. Car was twitching randomly. So i decided to gain some more info on what i’m doing.

I spent around 2-3 weeks to onboard general theory about deep learning (convolutional neural networks mostly) and got hands on experience with Keras (donkeycar library in particular, fixed two bugs [1](https://github.com/wroscoe/donkey/commit/348519c9b0acf8dde0df687b15f103826c19b625) [2](https://github.com/wroscoe/donkey/commit/ffa40d63a5b42d0f7759600824990bae2b644b2d)).

## Here are my recommendations on what to read:

* To get an idea about ML in general, something like [this blog](https://elitedatascience.com/learn-machine-learning) would be awesome start for 1-2 hours. Also try to find as simple as possible examples analogies with human brain, etc.

* [Stanford Convolutional Neural networks class](http://cs231n.github.io/) is really awesome for deep dive (for a week), they start from scratch (make sure to refresh [matrix multiplication](https://en.wikipedia.org/wiki/Matrix_multiplication), [differential](https://en.wikipedia.org/wiki/Differential_of_a_function), [exponential function](https://en.wikipedia.org/wiki/Exponential_function)) and reason all techniques that are used in “state-of-art” algorithms today. I recommend to start from [Module 2](http://cs231n.github.io/convolutional-networks/) about CNN and then [go from the beginning](http://cs231n.github.io/classification/) to reason all the techniques. Make sure to take a pen and paper making sure you have an idea on most of the formulas.

* Practice with code. In my case, i deep dived to [donkeycar library](https://github.com/wroscoe/donkey), which also uses Keras + TensorFlow. It’s up to you what to do e.g. doing exercises from course above. Then slowly move to [Keras documentation](https://keras.io/) on particular functions/parameters.

* One more recommendation related to self-driving cars (useful as overview on what’s going on in industry) is fresh (Jan 2018) MIT class [“Deep Learning for Self-Driving Cars”](https://selfdrivingcars.mit.edu/). I find it useful to get “state-of-art” algorithms overview and then go and do my own research on particular topic.

* One more [awesome paper](https://arxiv.org/abs/1803.09386) on ANN performance was released in March 2018. They use similar to donkey car platform and compare different ANNs performance.

# Instead of the conclusion

Below is [CNN model arhitecture](https://github.com/wroscoe/donkey/blob/04900dc02f9fa2961de76672f2a0f818e33ae0f3/donkeycar/parts/keras.py#L154-L179) of donkey car. It is around 20 lines of code, it's mindblowing.

{{< highlight python >}}
    img_in = Input(shape=(120, 160, 3), name='img_in')
    x = img_in
    x = Convolution2D(24, (5,5), strides=(2,2), activation='relu')(x)
    x = Convolution2D(32, (5,5), strides=(2,2), activation='relu')(x)
    x = Convolution2D(64, (5,5), strides=(2,2), activation='relu')(x)
    x = Convolution2D(64, (3,3), strides=(2,2), activation='relu')(x)
    x = Convolution2D(64, (3,3), strides=(1,1), activation='relu')(x)
    x = Flatten(name='flattened')(x)
    x = Dense(100, activation='relu')(x)
    x = Dropout(.1)(x)
    x = Dense(50, activation='relu')(x)
    x = Dropout(.1)(x)
    angle_out = Dense(15, activation='softmax', name='angle_out')(x)
    throttle_out = Dense(1, activation='relu', name='throttle_out')(x)

    model = Model(inputs=[img_in], outputs=[angle_out, throttle_out])
    model.compile(optimizer='adam',
                  loss={'angle_out': 'categorical_crossentropy',
                        'throttle_out': 'mean_absolute_error'},
                  loss_weights={'angle_out': 0.9, 'throttle_out': .001})
{{< / highlight >}}
