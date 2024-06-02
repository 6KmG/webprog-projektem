import imageio                                  #kép beolvasáshoz
import matplotlib.pyplot as plt                 #kép megjelenítéshez

fig_size = plt.rcParams["figure.figsize"]       #kép méret növelése
fig_size[0] = 10
fig_size[1] = 8
plt.rcParams["figure.figsize"] = fig_size

image = imageio.v2.imread('https://hub-courses.pages.pasteur.fr/ScientificPython/2-DataMangling/images/numpy.jpg')
print(type(image))

image.shape, image.dtype

plt.imshow(image)
plt.show()