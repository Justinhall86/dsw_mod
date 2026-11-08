{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "advancedDecal",
			"name": "Stars",
			"enabled": false,
			"z": 0.1,
			"scaleX": 15,
			"scaleY": 5,
			"scaleZ": 100,
			"rotationZ": 89.99999999999999,
			"albedoMap": "Fx/Alphas/T_Flare07_512.png",
			"fadePower": 2,
			"fadeEnd": 2,
			"emissive": 1,
			"renderMode": "AfterTonemapping",
			"blendMode": 2,
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 1
					},
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8480245798826219,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.42129447239079937,
										"dt": -0.03928170450720808
									},
									"nextHandle": {
										"dv": 1.1279106675889756,
										"dt": 0.10697542011737793
									}
								},
								{
									"time": 1.22,
									"value": 0.9658333333333333,
									"mode": 2
								},
								{
									"time": 3.572085266113282,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.042671786838107684,
										"dt": -0.6217012023925783
									},
									"nextHandle": {
										"dv": -0.042671786838107684,
										"dt": 0.6217012023925783
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 1,
						"color": [
							1,
							0.8196078431372549,
							0.8156862745098039
						]
					}
				}
			]
		},
		{
			"type": "advancedDecal",
			"name": "Stars",
			"z": 0.1,
			"scaleX": 100,
			"scaleY": 12,
			"scaleZ": 100,
			"rotationZ": 89.99999999999999,
			"albedoMap": "Fx/Alphas/T_Flare07_512.png",
			"fadePower": 2,
			"fadeEnd": 2,
			"emissive": 1,
			"renderMode": "AfterTonemapping",
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 0.3
					},
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8480245798826219,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.42129447239079937,
										"dt": -0.03928170450720808
									},
									"nextHandle": {
										"dv": 1.1279106675889756,
										"dt": 0.10697542011737793
									}
								},
								{
									"time": 1.22,
									"value": 0.9658333333333333,
									"mode": 2
								},
								{
									"time": 2.7524427795410187,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.013146064814814895,
										"dt": -0.5924427795410185
									},
									"nextHandle": {
										"dv": -0.013146064814814895,
										"dt": 0.5924427795410185
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 1,
						"color": [
							1,
							0.8196078431372549,
							0.8156862745098039
						]
					}
				}
			]
		},
		{
			"type": "advancedDecal",
			"name": "Stars",
			"z": 0.1,
			"scaleX": 200,
			"scaleY": 30,
			"scaleZ": 100,
			"rotationZ": 89.99999999999999,
			"albedoMap": "Fx/Alphas/T_Flare07_512.png",
			"fadePower": 2,
			"fadeEnd": 2,
			"emissive": 1,
			"renderMode": "AfterTonemapping",
			"blendMode": 2,
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 1
					},
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.19493827160493826,
									"value": -0.03410913357204853,
									"mode": 0
								},
								{
									"time": 0.8480245798826219,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.42129447239079937,
										"dt": -0.03928170450720808
									},
									"nextHandle": {
										"dv": 1.1279106675889756,
										"dt": 0.10697542011737793
									}
								},
								{
									"time": 1.22,
									"value": 0.9658333333333333,
									"mode": 2
								},
								{
									"time": 1.4314814814814814,
									"value": 0.8040562499999999,
									"mode": 0
								},
								{
									"time": 2.7524427795410187,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.023476556735568643,
										"dt": -0.5024427795410187
									},
									"nextHandle": {
										"dv": -0.023476556735568643,
										"dt": 0.5024427795410187
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 1,
						"color": [
							1,
							0.8,
							0.3058823529411765
						]
					}
				}
			]
		},
		{
			"type": "advancedDecal",
			"name": "Stars",
			"z": 0.1,
			"scaleX": 150,
			"scaleY": 70,
			"scaleZ": 100,
			"rotationZ": 90,
			"albedoMap": "Fx/Alphas/T_Flare07_512.png",
			"fadePower": 2,
			"fadeEnd": 2,
			"emissive": 1,
			"renderMode": "AfterTonemapping",
			"blendMode": 2,
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 1
					},
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8480245798826219,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.42129447239079937,
										"dt": -0.03928170450720808
									},
									"nextHandle": {
										"dv": 1.1279106675889756,
										"dt": 0.10697542011737793
									}
								},
								{
									"time": 1.22,
									"value": 0.9658333333333333,
									"mode": 2
								},
								{
									"time": 2.7524427795410187,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.0004968278463649001,
										"dt": -0.6324427795410186
									},
									"nextHandle": {
										"dv": -3.8680319017027026e-16,
										"dt": 0.5559679510729727
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 1,
						"color": [
							1,
							0.17254901960784313,
							0.07450980392156863
						]
					}
				}
			]
		},
		{
			"type": "advancedDecal",
			"name": "Flash",
			"scaleX": 400,
			"scaleY": 400,
			"scaleZ": 100,
			"albedoMap": "Fx/Alphas/T_circle2.png",
			"fadePower": 3,
			"fadeStart": 1,
			"fadeEnd": 2,
			"renderMode": "AfterTonemapping",
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 1
					},
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8420060729980471,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.16233005820240903,
										"dt": -0.11904187797929618
									},
									"nextHandle": {
										"dv": 0.16233005820240903,
										"dt": 0.11904187797929618
									}
								},
								{
									"time": 1.0712646484375001,
									"value": 0.8579819444444443,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003980294014011866,
										"dt": -0.057637364828988735
									},
									"nextHandle": {
										"dv": -0.07190092592592601,
										"dt": 1.0384118652343755
									}
								},
								{
									"time": 3.546055908203128,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.2354618055555555,
										"dt": -0.048054199218750426
									},
									"nextHandle": {
										"dv": -0.8323239738837259,
										"dt": 0.032247805516062523
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 0.7,
						"color": [
							1,
							0.9098039215686274,
							0.611764705882353
						]
					},
					"children": [
						{
							"type": "curve",
							"name": "amount",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.017160493827160492,
									"value": 0.17023174683077483,
									"mode": 2
								},
								{
									"time": 0.21469135802469136,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.11691358024691358
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.12670781893004113
									}
								},
								{
									"time": 0.4754320987654321,
									"value": 0.17023174683077483,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.12670781893004113
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.17829218106995884
									}
								},
								{
									"time": 0.8191358024691358,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.17829218106995884
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.12985596707818928
									}
								},
								{
									"time": 1.249753086419753,
									"value": 0.17023174683077483,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.12985596707818928
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.10403292181069967
									}
								},
								{
									"time": 1.478888888888889,
									"value": 0.6,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.10403292181069967
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.11456790123456788
									}
								},
								{
									"time": 1.9529629629629628,
									"value": 0.17023174683077483,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.11456790123456788
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16065843621399178
									}
								},
								{
									"time": 2.3638271604938272,
									"value": 0.6,
									"mode": 2
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "advancedDecal",
			"name": "Flash",
			"enabled": false,
			"x": 35,
			"scaleX": 320,
			"scaleY": 250,
			"scaleZ": 100,
			"albedoMap": "Fx/Alphas/T_circle2.png",
			"fadePower": 3,
			"fadeStart": 1,
			"fadeEnd": 2,
			"renderMode": "AfterTonemapping",
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 2
					},
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8420060729980471,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.16233005820240903,
										"dt": -0.11904187797929618
									},
									"nextHandle": {
										"dv": 0.16233005820240903,
										"dt": 0.11904187797929618
									}
								},
								{
									"time": 1.0712646484375001,
									"value": 0.8579819444444443,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003980294014011866,
										"dt": -0.057637364828988735
									},
									"nextHandle": {
										"dv": -0.07190092592592601,
										"dt": 1.0384118652343755
									}
								},
								{
									"time": 2.8492700195312524,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.2354618055555555,
										"dt": -0.048054199218750426
									},
									"nextHandle": {
										"dv": -0.8323239738837259,
										"dt": 0.032247805516062523
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 1.5,
						"color": [
							1,
							0.8156862745098039,
							0.6588235294117647
						]
					}
				}
			]
		},
		{
			"type": "advancedDecal",
			"name": "Flash",
			"x": 30,
			"scaleX": 2500,
			"scaleY": 2500,
			"scaleZ": 100,
			"albedoMap": "Fx/Alphas/T_circle2.png",
			"fadePower": 2,
			"fadeStart": 1,
			"fadeEnd": 2,
			"renderMode": "AfterTonemapping",
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 1.3
					},
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.02457304813177874,
										"dt": -0.4999417385222912
									},
									"nextHandle": {
										"dv": -0.032194444444444525,
										"dt": 0.6549999999999999
									}
								},
								{
									"time": 0.8420060729980471,
									"value": -0.11268055555555556,
									"mode": 0,
									"prevHandle": {
										"dv": -0.16233005820240903,
										"dt": -0.11904187797929618
									},
									"nextHandle": {
										"dv": 0.16233005820240903,
										"dt": 0.11904187797929618
									}
								},
								{
									"time": 1.0472375488281251,
									"value": 0.8579819444444443,
									"mode": 0,
									"prevHandle": {
										"dv": 0.005131706220068913,
										"dt": -0.057619293514992675
									},
									"nextHandle": {
										"dv": -0.08987615740740751,
										"dt": 1.0063757324218756
									}
								},
								{
									"time": 3.377866210937503,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.037734259259259,
										"dt": -0.016018066406250142
									},
									"nextHandle": {
										"dv": -0.8349685635793681,
										"dt": 0.012828554662434193
									}
								}
							]
						}
					]
				},
				{
					"type": "shader",
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"props": {
						"amount": 1,
						"color": [
							1,
							0.6823529411764706,
							0.4823529411764706
						]
					}
				}
			]
		}
	]
}