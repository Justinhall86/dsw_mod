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
					"source": "Vehicle/Vernius/AutomatedMilitia/AutomatedMilitia.fbx",
					"editorOnly": true,
					"type": "model",
					"children": [
						{
							"name": "animEvent",
							"animation": "Anim/AutomatedMilitia/Anim_AutomatedMilitia_Death.fbx",
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
							"x": 0.12846,
							"y": 0.76773,
							"z": 0.06703,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"rotationX": 26.2,
							"rotationY": 20.4,
							"rotationZ": 9.7,
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
							"name": "Explosions",
							"x": -0.40531,
							"y": 1.2209,
							"z": 0.22274,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"rotationX": -3.8,
							"rotationY": -32,
							"rotationZ": -4.9,
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
											"time": 0.04171449009773661,
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
											"time": -0.11490234374999989,
											"type": "subFX"
										}
									]
								}
							]
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
								"instScale": 0.8,
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
							"y": 1.57371,
							"z": 0.5501,
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
											"time": 0.9303809552460185,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.978783413003315,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.339430265502452,
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