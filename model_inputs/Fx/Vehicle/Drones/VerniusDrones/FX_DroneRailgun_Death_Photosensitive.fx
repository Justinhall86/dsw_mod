{
	"type": "fx",
	"duration": 3.5,
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "DroneRailGun",
					"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
					"editorOnly": true,
					"rotationZ": 90,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneRailgun/Anim_DroneRailgun_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"y": -0.2907,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "object",
							"name": "Explosions",
							"y": 0.49192,
							"children": [
								{
									"type": "object",
									"name": "Big Explosion",
									"y": 0.39456,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"children": [
										{
											"type": "object",
											"name": "Explo1",
											"x": 0.52659,
											"y": -0.3816,
											"z": 1.31022,
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": -83.3,
											"rotationY": -2.5,
											"rotationZ": -26.3,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_trails_Base_Noflare_Photosensitive",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
													"scaleX": 0.35,
													"scaleY": 0.35,
													"scaleZ": 0.53,
													"time": -0.25
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local_Photosensitive",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local_Photosensitive.fx",
													"x": 0.095,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555,
													"time": -0.35
												}
											]
										},
										{
											"type": "object",
											"name": "Explo2",
											"x": -0.48844,
											"y": -0.33134,
											"z": 0.4162,
											"scaleX": 0.7,
											"scaleY": 0.7,
											"scaleZ": 0.7,
											"rotationX": 88.5,
											"rotationY": 4.4,
											"rotationZ": -21.9,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_trails_Base_Noflare_Photosensitive",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
													"scaleX": 0.30000000000000004,
													"scaleY": 0.2999999999999998,
													"scaleZ": 0.4499999999999999,
													"time": -0.2
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local_Photosensitive",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local_Photosensitive.fx",
													"x": 0.095,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555,
													"time": -0.4
												}
											]
										},
										{
											"type": "object",
											"name": "Explo3",
											"x": 0.24108,
											"y": -0.17089,
											"z": -1.00595,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"rotationX": -97.8,
											"rotationY": -0.2,
											"rotationZ": -9.7,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_trails_Base_Noflare_Photosensitive",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
													"scaleX": 0.35,
													"scaleY": 0.35,
													"scaleZ": 0.53,
													"time": -0.1
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local_Photosensitive",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local_Photosensitive.fx",
													"x": 0.095,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555,
													"time": -0.3
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						},
						{
							"type": "object",
							"name": "LightDecals",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 1.00485,
									"y": 0.53467,
									"z": 1.64619,
									"scaleX": 2,
									"scaleY": 4,
									"scaleZ": 2,
									"rotationX": 93,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
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
													"keys": [
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7184236144759407,
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8295430878429378,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8383316373469836,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8383316373469836,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8383316373469836,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8383316373469836,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": -0.95424,
									"y": -0.0691,
									"z": 0.54345,
									"scaleX": 2,
									"scaleY": 5,
									"scaleZ": 1.25,
									"rotationX": 93,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
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
													"keys": [
														{
															"time": 0.08230766554200591,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.1297103672798115,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7184236144759407,
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.037485424494902775,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.037485424494902775,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8005322704435467,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8005322704435467,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8005322704435467,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8005322704435467,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8005322704435467,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8005322704435467,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8174072704435469,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8174072704435469,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8174072704435469,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8174072704435469,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8174072704435469,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8174072704435469,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 0.40654,
									"y": 0.77706,
									"z": -1.41909,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 3,
									"rotationX": 92.99999999999999,
									"rotationZ": -1.987846675914698e-16,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
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
													"keys": [
														{
															"time": 0.16293055057358213,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.23321457473230373,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7141052663446092,
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.0653735537311957,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.0753735537311957,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8115768389327486,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8115768389327486,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8115768389327486,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8115768389327486,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8115768389327486,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8115768389327486,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8284518389327488,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8284518389327488,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8284518389327488,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8284518389327488,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8284518389327488,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8284518389327488,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.DroneRailGun.root.JNT_Root"
				}
			]
		}
	]
}