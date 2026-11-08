{
	"type": "fx",
	"cullingRadius": 0,
	"children": [
		{
			"type": "reference",
			"name": "PreviewScene",
			"source": "Fx/FX_PreviewScene.l3d",
			"enabled": false,
			"locked": true
		},
		{
			"type": "object",
			"name": "FXRoot",
			"y": 0.04,
			"z": 1.9,
			"rotationZ": -82,
			"children": [
				{
					"type": "reference",
					"name": "SpiceBlow",
					"source": "Environment/Asset/SpiceBlow/SpiceBlow.prefab",
					"z": -1.9,
					"scaleX": 30,
					"scaleY": 30,
					"scaleZ": 30,
					"rotationZ": 82
				},
				{
					"type": "model",
					"name": "Disk_StraightUVs",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"x": 0.04,
					"y": -0.01,
					"z": -1.47,
					"scaleX": 28,
					"scaleY": 28,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "DecalPass",
									"blend": "Add",
									"shadows": false,
									"culling": "Back",
									"colorMask": 255,
									"depthTest": "LessEqual"
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/perlin1_normal.png",
							"mainPassName": "decal"
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.4,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl07u_A.png",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1.5
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorMap",
							"source": "shaders/ColorMap.hx",
							"props": {
								"USE_ALPHA": true,
								"colorA": [
									0.14509803921568626,
									0.38823529411764707,
									1
								],
								"pointA": 0.55,
								"colorB": [
									0.4117647058823529,
									0.28627450980392155,
									0.5137254901960784
								],
								"pointB": 0.05
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
								"progress": 0.37,
								"saturation": 0.56,
								"width": 0.86,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/T_Noise_Wave_03.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.005,
									-0.015
								],
								"uvScaleSpeed": [
									0,
									0
								]
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
								"progress": 0.45,
								"saturation": 0,
								"width": 0.28,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/perlin2.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.025,
									0.025
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"enabled": false,
							"props": {
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Dust_Blue_Late",
					"props": {
						"instScale_rand": 5,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0.2,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.49411764705882355,
							0.13725490196078433,
							0.28627450980392155,
							1
						],
						"emitRate": 2,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
						"lifeTime": 10,
						"burstDelay": 0.2,
						"useRandomColor": true,
						"instScale": 10,
						"warmUpTime": 10,
						"burstParticleCount": 10,
						"alignMode": "Screen",
						"instAcceleration_rand": [
							0.05,
							0.05,
							0.05
						],
						"emitShape": "Cylinder",
						"emitRad1": 0.59,
						"emitRad2": 0.8,
						"speedFactor": 0.5
					},
					"x": 0.09,
					"y": 0.34,
					"z": 0.52,
					"scaleX": 14.999999999999996,
					"scaleY": 14.999999999999996,
					"scaleZ": 2,
					"rotationZ": 82,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"color": 872415231,
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
											"textureWrap": true,
											"emissive": 3
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
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16833333333333333
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.06
													},
													"nextHandle": {
														"dv": -3.102438557839962e-16,
														"dt": 0.19000000000000003
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
													"value": 0.3498306274414062,
													"mode": 0,
													"prevHandle": {
														"dv": 0.34528353621197455,
														"dt": -0.4602148641995827
													},
													"nextHandle": {
														"dv": -0.34528353621197455,
														"dt": 0.4602148641995827
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.8483109975988127,
														"dt": -0.4835372686313232
													},
													"nextHandle": {
														"dv": -0.5,
														"dt": 0.28500000000000003
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												}
											]
										}
									]
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.73,
									"dirBrighten": true,
									"dirIntensity": 0.92,
									"envBlend": 0.5,
									"envColorSet": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.44705882352941173,
											0.5882352941176471,
											0.9411764705882353
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.2,
									"mode": 0,
									"prevHandle": {
										"dv": -0.0271089389830641,
										"dt": -0.06
									},
									"nextHandle": {
										"dv": 0.0271089389830641,
										"dt": 0.06
									}
								},
								{
									"time": 1,
									"value": 0.7,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3333333333333333
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.3333333333333333
									}
								}
							]
						}
					]
				}
			]
		}
	]
}