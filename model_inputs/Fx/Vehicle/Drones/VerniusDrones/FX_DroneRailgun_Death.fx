{
	"type": "fx",
	"duration": 3.5,
	"cullingRadius": 150,
	"blendFactor": 1,
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
									"name": "DamageDecal",
									"enabled": false,
									"x": -0.27731,
									"y": 1.21736,
									"z": -1.21034,
									"children": [
										{
											"type": "advancedDecal",
											"name": "Decal_Large",
											"x": 0.07358,
											"y": -0.61709,
											"z": 0.92967,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 1.78,
											"rotationX": 89.4,
											"rotationY": -5.6,
											"rotationZ": 4.3,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
											"albedoStrength": 1.1,
											"children": [
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.67,
														"saturation": 1,
														"width": 0.24,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.3407548191840422,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02356852808625938,
																		"dt": -0.4998915283640561
																	},
																	"nextHandle": {
																		"dv": 0.01611111111111113,
																		"dt": 0.33834989965171247
																	}
																},
																{
																	"time": 0.6648664375857546,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 6.003642425539476,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 10.03032049712031,
																	"value": 0,
																	"mode": 0
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
													"name": "FX_Directional_Explosion_trails_Base_Noflare",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
													"scaleX": 0.35,
													"scaleY": 0.35,
													"scaleZ": 0.53,
													"time": -0.25
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
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
													"name": "FX_Directional_Explosion_trails_Base_Noflare",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
													"scaleX": 0.30000000000000004,
													"scaleY": 0.2999999999999998,
													"scaleZ": 0.4499999999999999,
													"time": -0.2
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
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
													"name": "FX_Directional_Explosion_trails_Base_Noflare",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
													"scaleX": 0.35,
													"scaleY": 0.35,
													"scaleZ": 0.53,
													"time": -0.1
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
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
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0,
															"value": 0,
															"mode": 0
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