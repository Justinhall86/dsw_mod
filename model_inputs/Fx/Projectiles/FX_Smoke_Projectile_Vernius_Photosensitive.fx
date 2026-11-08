{
	"type": "fx",
	"cullingRadius": 1500,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.7,
			"scaleY": 0.7,
			"scaleZ": 0.7,
			"children": [
				{
					"type": "object",
					"name": "Test02",
					"children": [
						{
							"type": "object",
							"name": "group",
							"children": [
								{
									"type": "object",
									"name": "Missile",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"children": [
										{
											"type": "model",
											"name": "Reactor_Little",
											"source": "Fx/Meshes_Common/CylinderCone_BottomPiv_LessVrtx.fbx",
											"x": -0.73829,
											"y": 0.00156,
											"scaleX": 0.8,
											"scaleY": 0.8,
											"scaleZ": 2.14,
											"rotationY": -90,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.2,
														"saturation": 1,
														"width": 0.2,
														"uvScaleX": 0.7,
														"uvScaleY": 0.7,
														"texture": "Fx/noise/T_Noise_Voronoi_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															3,
															2
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
														"progress": 0.27,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": -1,
														"texture": "Fx/Gradients/Gradient_Spotlight.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															2,
															0
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.87,
														"color": [
															0.16470588235294117,
															0.2784313725490196,
															1
														]
													},
													"isInstance": true
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
											}
										},
										{
											"type": "model",
											"name": "Missile",
											"source": "Fx/Meshes_Common/Missile_LessVrtx.fbx",
											"scaleX": 3.3,
											"scaleY": 3.3,
											"scaleZ": 3.3,
											"rotationZ": 90.00000000000004,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "PBR",
															"blend": "Alpha",
															"shadows": false,
															"culling": "Back",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 0.1
														}
													},
													"diffuseMap": "Structure/Buildings/MissileBattery/MissileBattery_Albedo.png"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "model",
											"name": "MissileGLOW",
											"source": "Fx/Meshes_Common/Missile_LessVrtx.fbx",
											"x": 0.0183,
											"scaleX": 3.4,
											"scaleY": 3.4,
											"scaleZ": 3.4,
											"rotationZ": 90.00000000000004,
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
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 2
														}
													},
													"diffuseMap": "Structure/Buildings/MissileBattery/MissileBattery_Albedo.png"
												},
												{
													"type": "shader",
													"name": "Fresnel",
													"source": "shaders/Fresnel.hx",
													"props": {
														"RGB": false,
														"ALPHA": true,
														"REVERSE": false,
														"bias": 0.05,
														"scale": 0.95,
														"power": 1,
														"color": [
															0,
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.30196078431372547,
															0.17254901960784313,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0,
														"maxAlpha": 1,
														"frequency": 4
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
			]
		}
	]
}