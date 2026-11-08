{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Smoke_Soft_2",
					"props": {
						"lifeTime": 6,
						"alignMode": "Screen",
						"instScale_rand": 0.2,
						"maxCount": 100,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"simulationSpace": "World",
						"instStretch_rand": [
							0.2,
							0.2,
							0.2
						],
						"animationSpeed": 0.3,
						"randomColor1": [
							1,
							1,
							1,
							0.7215686274509804
						],
						"randomColor2": [
							0.7607843137254902,
							0.7098039215686275,
							0.6470588235294118,
							0.25098039215686274
						],
						"useRandomColor": true,
						"emitShape": "Cone",
						"emitAngle": 50,
						"emitRate": 4,
						"instSpeed": [
							0.1,
							0,
							0.4
						],
						"instSpeed_rand": [
							0.05,
							0,
							0.1
						],
						"instAcceleration": [
							0.05,
							0,
							null
						],
						"instAcceleration_rand": [
							0.04,
							0,
							0
						],
						"lifeTimeRand": 1,
						"speedFactor": 0.5,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
						"warmUpTime": 1
					},
					"scaleX": 0.10000000000000003,
					"scaleY": 0.10000000000000005,
					"scaleZ": 0.10000000000000003,
					"rotationZ": 90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.0050000000000000044,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.05,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.008786899796430459,
														"dt": -0.03490382642970474
													},
													"nextHandle": {
														"dv": -0.22055555555555562,
														"dt": 0.8749999999999999
													}
												},
												{
													"time": 0.95,
													"value": 0,
													"mode": 2
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
											0.7725490196078432,
											0.7725490196078432,
											0.7725490196078432
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 0,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 0.5,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/perlin2.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.01,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.9543682199021406,
														"dt": -0.3946635495835917
													},
													"nextHandle": {
														"dv": -1.209090909090909,
														"dt": 0.5
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"enabled": false,
									"props": {
										"levelMin": 0.5,
										"levelMax": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.73,
									"dirIntensity": 0.68,
									"dirSpan": 0.75,
									"envBlend": 0.5,
									"envColorSet": true
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.01,
										"useRGB": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.9499166666666667,
									"mode": 0,
									"prevHandle": {
										"dv": 0.04688100506692539,
										"dt": -0.3750480405353989
									},
									"nextHandle": {
										"dv": -0.024999999999999967,
										"dt": 0.2
									}
								},
								{
									"time": 1,
									"value": 1.5,
									"mode": 1,
									"prevHandle": {
										"dv": -0.19999999999999996,
										"dt": -0.5049999999999999
									},
									"nextHandle": {
										"dv": 0.17500000000000004,
										"dt": -0.050000000000000044
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instRotation.z",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 0.4545454545454546,
									"mode": 2
								}
							]
						}
					]
				}
			]
		}
	]
}