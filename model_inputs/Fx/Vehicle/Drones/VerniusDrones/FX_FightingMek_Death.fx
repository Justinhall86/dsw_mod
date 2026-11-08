{
	"duration": 5,
	"cullingRadius": 10,
	"type": "fx",
	"children": [
		{
			"name": "FXRoot",
			"type": "object",
			"children": [
				{
					"name": "FightingMek",
					"source": "Character/Vernius/Unit/FightingMek/FightingMek.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"type": "model",
					"children": [
						{
							"name": "animEvent",
							"animation": "Anim/FightingMek/Anim_FightingMek_Death.fbx",
							"type": "animEvent"
						}
					]
				},
				{
					"name": "Death",
					"y": -0.2907,
					"type": "object",
					"children": [
						{
							"name": "Explosions",
							"y": 0.1823,
							"z": 0.11198,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"type": "object",
							"children": [
								{
									"name": "ExploTOP",
									"type": "object",
									"children": [
										{
											"name": "FX_Directional_Explosion_trails_Base_Noflare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.45,
											"time": -0.14338316615226343,
											"type": "subFX"
										},
										{
											"name": "FX_Directional_Explosion_Low_Local",
											"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
											"x": 0.24332,
											"y": -0.19911,
											"z": 0.13052,
											"scaleX": 0.8680555555555555,
											"scaleY": 0.8680555555555558,
											"scaleZ": 0.8680555555555555,
											"time": -0.3,
											"type": "subFX"
										},
										{
											"name": "FX_Directional_Explosion_Low_Local",
											"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
											"enabled": false,
											"x": 0.22149,
											"y": -0.58286,
											"z": 0.22117,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"time": -0.14338316615226343,
											"type": "subFX"
										}
									]
								}
							]
						},
						{
							"name": "LightDecals",
							"enabled": false,
							"type": "object",
							"children": [
								{
									"name": "Explo01",
									"x": 0.77934,
									"y": 0.26737,
									"z": 2.61796,
									"scaleX": 6,
									"scaleY": 4,
									"scaleZ": 2,
									"rotationX": 90,
									"rotationY": 25,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"type": "advancedDecal",
									"children": [
										{
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
											},
											"type": "material"
										},
										{
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"type": "shader",
											"children": [
												{
													"name": "scale",
													"keys": [
														{
															"time": 0.04193469130456537,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.07943667146907098,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.69238596673234,
															"value": 0,
															"mode": 2
														}
													],
													"type": "curve"
												}
											]
										},
										{
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
											"isInstance": true,
											"type": "shader"
										},
										{
											"name": "visibility",
											"keys": [
												{
													"time": 0.0249501955501222,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.02910856147514257,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7173063801382568,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7296502538985383,
													"value": 0,
													"mode": 2
												}
											],
											"type": "curve"
										}
									]
								}
							]
						},
						{
							"name": "BigElec",
							"enabled": false,
							"x": 0.93141,
							"y": -1.04482,
							"z": 2.78188,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"rotationX": -90,
							"type": "object",
							"children": [
								{
									"name": "HighExplosionAnticipation",
									"x": -1.09794,
									"y": 4.98315,
									"z": 6.11328,
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 12,
									"rotationX": 179.99999999999997,
									"rotationY": 3.053332494204975e-15,
									"rotationZ": 4.198332179531841e-15,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
									"type": "advancedDecal",
									"children": [
										{
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
											},
											"type": "material"
										},
										{
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"isInstance": true,
											"type": "shader",
											"children": [
												{
													"name": "scale",
													"keys": [
														{
															"time": 0.20764697029585577,
															"value": -0.01666666666666672,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.00221760560382156
															}
														},
														{
															"time": 0.2276885198614611,
															"value": 1.5,
															"mode": 2
														},
														{
															"time": 0.6522987913153172,
															"value": 0,
															"mode": 2
														}
													],
													"type": "curve"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4666666666666667,
													0.8352941176470589,
													1
												]
											},
											"isInstance": true,
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"type": "shader"
										},
										{
											"name": "visibility",
											"keys": [
												{
													"time": 0.20725724174971283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22729879131531816,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7346791167497116,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.754720666315317,
													"value": 0,
													"mode": 2
												}
											],
											"type": "curve"
										}
									]
								},
								{
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"warmUpTime": -0.2,
										"instScale": 0.8
									},
									"x": 0.9227,
									"y": 2.16893,
									"z": 1.86819,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"rotationX": 5.7,
									"rotationY": -8.8,
									"rotationZ": 36.3,
									"type": "emitter",
									"children": [
										{
											"name": "Mesh_ElectricityBig",
											"source": "Fx/Structure/CorrinoBase/Mesh_ElectricityBig02.fbx",
											"rotationX": 90,
											"type": "model",
											"children": [
												{
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true,
													"type": "shader"
												},
												{
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true,
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true,
											"type": "shader"
										}
									]
								},
								{
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"warmUpTime": -0.3
									},
									"x": -0.98344,
									"y": 1.81036,
									"z": 0.05819,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"rotationX": 1.7,
									"rotationY": 0.2,
									"rotationZ": -1.8,
									"type": "emitter",
									"children": [
										{
											"name": "Mesh_ElectricityBig",
											"source": "Fx/Structure/CorrinoBase/Mesh_ElectricityBig02.fbx",
											"rotationX": 90,
											"type": "model",
											"children": [
												{
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"type": "material"
												},
												{
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true,
													"type": "shader"
												},
												{
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true,
													"type": "shader"
												},
												{
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"type": "shader"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true,
											"type": "shader"
										}
									]
								}
							]
						},
						{
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true,
							"type": "shader"
						},
						{
							"name": "emitter_Elec",
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 30,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 0.55,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_03.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.1,
								"animationBlendBetweenFrames": false,
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"emitShape": "Cylinder",
								"emitAngle": 360,
								"emitRad1": 0.73,
								"emitSurface": true
							},
							"y": 0.21311,
							"z": 0.09137,
							"scaleZ": 0.01,
							"type": "emitter",
							"children": [
								{
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"type": "material"
										},
										{
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"type": "shader",
											"children": [
												{
													"name": "progress",
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													],
													"type": "curve"
												}
											]
										},
										{
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -18584
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											},
											"type": "shader"
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true,
											"type": "shader"
										}
									]
								},
								{
									"name": "emitRate",
									"keys": [
										{
											"time": 0.8033794162826411,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.8517818740399375,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.212428726539075,
											"value": 0,
											"mode": 2
										}
									],
									"type": "curve"
								}
							]
						}
					]
				},
				{
					"name": "constraint",
					"object": ".FXRoot.Death",
					"target": ".FXRoot.FightingMek.root.JNT_Root",
					"type": "constraint"
				}
			]
		}
	]
}