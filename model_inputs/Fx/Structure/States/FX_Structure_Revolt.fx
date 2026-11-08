{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Village",
					"editorOnly": true,
					"x": 0.024,
					"y": -0.193174,
					"z": 0.808072,
					"children": [
						{
							"type": "polygon",
							"name": "FX_Smoke",
							"x": -0.024,
							"y": -0.04550599999999999,
							"z": 1.442728,
							"scaleX": 6.000000000000001,
							"scaleY": 10.000000000000002,
							"scaleZ": 2.0000000000000004,
							"rotationX": -89.99999999999999,
							"rotationZ": -70.80000000000001,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 3,
												"uScale": 0.5,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 2,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0.02,
												"shiftSpeedY": 0
											},
											"recursiveApply": false,
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03.jpg"
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
												"progress": 0.46,
												"saturation": 0,
												"width": 0.77,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
													0.05
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
												"progress": 0.42,
												"saturation": 0,
												"width": 0.28,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.01
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
												"amount": 1,
												"color": [
													0.10196078431372549,
													0.10196078431372549,
													0.10196078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "polygon",
							"name": "FX_Fire",
							"x": -0.024,
							"y": -0.8958360000000001,
							"z": 0.951338,
							"scaleX": 6,
							"scaleY": 5.41,
							"scaleZ": 2,
							"rotationX": -89.99999999999999,
							"rotationZ": -70.8,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0,
											"emissive": 20
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 0.5,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 2,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0.02,
												"shiftSpeedY": 0
											},
											"recursiveApply": false,
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.55,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03.jpg"
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
												"progress": 0.66,
												"saturation": 0,
												"width": 0.77,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
													0.05
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
												"progress": 0.66,
												"saturation": 0,
												"width": 0.77,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.01
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.4627450980392157,
													0
												]
											},
											"isInstance": true
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "object",
							"name": "States",
							"x": -0.024,
							"y": 0.193174,
							"z": -0.8080719999999999,
							"children": [
								{
									"type": "object",
									"name": "Revolt_01",
									"children": [
										{
											"type": "reference",
											"name": "FX_Fire_01",
											"source": "Fx/Smoke/FX_Fire_01.fx",
											"x": 0.36,
											"y": -2.44,
											"z": 1.6,
											"scaleX": 0.55,
											"scaleY": 0.55,
											"scaleZ": 0.55
										},
										{
											"type": "reference",
											"name": "FX_Fire_01",
											"source": "Fx/Smoke/FX_Fire_01.fx",
											"x": -2.37,
											"y": 1.82,
											"z": 1.2,
											"scaleX": 0.55,
											"scaleY": 0.55,
											"scaleZ": 0.55
										},
										{
											"type": "reference",
											"name": "FX_Fire_01",
											"source": "Fx/Smoke/FX_Fire_01.fx",
											"x": 0.98,
											"y": 1.23,
											"z": 0.05,
											"scaleX": 0.55,
											"scaleY": 0.55,
											"scaleZ": 0.55
										}
									],
									"enabled": false
								},
								{
									"type": "object",
									"name": "Revolt_02",
									"children": [
										{
											"type": "reference",
											"name": "FX_Fire_01",
											"source": "Fx/Smoke/FX_Fire_01.fx",
											"x": 0.45,
											"y": -2.69,
											"z": 1.32
										},
										{
											"type": "reference",
											"name": "FX_Fire_01",
											"source": "Fx/Smoke/FX_Fire_01.fx",
											"x": -2.37,
											"y": 1.82,
											"z": 1.2
										},
										{
											"type": "reference",
											"name": "FX_Fire_01",
											"source": "Fx/Smoke/FX_Fire_01.fx",
											"x": 0.98,
											"y": 1.23,
											"z": 0.05
										},
										{
											"type": "reference",
											"name": "FX_Fire_01",
											"source": "Fx/Smoke/FX_Fire_01.fx",
											"x": 0.65,
											"y": -0.43,
											"z": 0.3
										}
									],
									"enabled": false
								},
								{
									"type": "object",
									"name": "Pillaged_01",
									"children": [
										{
											"type": "reference",
											"name": "FX_Pillaged_Mist",
											"source": "Fx/Structure/Common/FX_Pillaged_Mist.fx",
											"x": -0.1,
											"y": 0.02,
											"z": -1.06,
											"scaleX": 6.99,
											"scaleY": 9.76,
											"scaleZ": 6.99,
											"rotationZ": -70.5
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_Grey_1",
											"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
											"x": 0.17,
											"y": -1.75,
											"z": 0.27,
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_Grey_1",
											"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
											"x": -1.184,
											"y": 1.8379999999999999,
											"z": 0.266,
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_Grey_2",
											"source": "Fx/Smoke/FX_Smoke_Big_Grey_2.fx",
											"x": 0.996,
											"y": -0.14200000000000002,
											"z": 0.266,
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"x": 0.16,
											"y": 0.09,
											"scaleX": 10.33,
											"scaleY": 10.33,
											"scaleZ": 8.05,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
											"albedoStrength": 1.5
										}
									],
									"enabled": false
								},
								{
									"type": "object",
									"name": "Pillaged_02",
									"children": [
										{
											"type": "reference",
											"name": "FX_Pillaged_Mist",
											"source": "Fx/Structure/Common/FX_Pillaged_Mist.fx",
											"x": -0.09,
											"y": 0.36,
											"z": -1.15,
											"scaleX": 7.48,
											"scaleY": 10.44,
											"scaleZ": 7.48,
											"rotationZ": -70.5
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_Grey_1",
											"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
											"x": -0.043999999999999984,
											"y": -2.002,
											"z": 0.266,
											"scaleX": 0.6,
											"scaleY": 0.6,
											"scaleZ": 0.6
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_Grey_1",
											"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
											"x": -1.184,
											"y": 1.8379999999999999,
											"z": 0.266,
											"scaleX": 0.6,
											"scaleY": 0.6,
											"scaleZ": 0.6
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_Grey_2",
											"source": "Fx/Smoke/FX_Smoke_Big_Grey_2.fx",
											"x": 0.996,
											"y": -0.14200000000000002,
											"z": 0.266,
											"scaleX": 0.6,
											"scaleY": 0.6,
											"scaleZ": 0.6
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"x": 0.08,
											"y": 0.04,
											"z": 0.27,
											"scaleX": 10.54,
											"scaleY": 10.54,
											"scaleZ": 8.22,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png"
										}
									],
									"enabled": false
								}
							]
						},
						{
							"type": "object",
							"name": "group",
							"x": 0.096,
							"y": 0.393174,
							"z": -0.8080719999999999,
							"rotationZ": 6.599999999999998,
							"children": [
								{
									"type": "object",
									"name": "FX",
									"x": -0.5266321196624828,
									"y": -0.5493611499185218,
									"z": 1.20125,
									"rotationZ": -6.599999999999999,
									"children": [
										{
											"type": "reference",
											"name": "Prefab_Antena_02",
											"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_02.prefab",
											"x": -0.78,
											"y": 3.00625,
											"z": -0.8212499999999999
										},
										{
											"type": "reference",
											"name": "Prefab_Antena_03",
											"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_03.prefab",
											"x": -1.89,
											"y": 2.03625,
											"z": 0.11875000000000013
										},
										{
											"type": "reference",
											"name": "Prefab_Antena_01",
											"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_01.prefab",
											"x": 2.26,
											"y": -1.18,
											"z": -0.82,
											"scaleX": 0.84,
											"scaleY": 0.84,
											"scaleZ": 0.84
										},
										{
											"type": "reference",
											"name": "LightYellow03_Sphere",
											"source": "Fx/Structure/Lights/LightYellow03_Sphere.fx",
											"x": 0.79,
											"y": -2.47375,
											"z": 1.13875,
											"scaleX": 0.25,
											"scaleY": 0.25,
											"scaleZ": 0.25
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_5",
											"source": "Fx/Smoke/FX_Smoke_Big_5.fx",
											"x": 2.37,
											"y": 0.87,
											"z": 0.59,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationZ": -145.7
										},
										{
											"type": "reference",
											"name": "FX_Smoke_Big_5",
											"source": "Fx/Smoke/FX_Smoke_Big_5.fx",
											"x": -1.2,
											"y": -1.84,
											"z": -0.58,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationZ": -145.7
										}
									],
									"enabled": false
								},
								{
									"type": "model",
									"name": "Village_Large_01",
									"source": "Structure/Village/Tiles/Model/Village_Large_01.fbx",
									"x": -0.1421921619706209,
									"y": -0.1848820950609353,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationZ": 102.20000000000003,
									"children": [
										{
											"type": "shader",
											"name": "WindCloth",
											"source": "shaders/WindCloth.hx",
											"enabled": false,
											"props": {
												"speed": 2,
												"amount": 3.64,
												"zamount": 1,
												"freq": 9.09
											},
											"targetMaterial": "VillageMisc_01_Wind_Neutral_MAT",
											"recursiveApply": false,
											"isInstance": true
										}
									]
								},
								{
									"type": "object",
									"name": "Decals",
									"x": -0.6033333333333332,
									"y": 1.2766666666666666,
									"children": [
										{
											"type": "tdecal",
											"name": "tdecal",
											"x": 0.33,
											"y": -1.08,
											"scaleX": 12.93,
											"scaleY": 12.93,
											"scaleZ": 0.44,
											"rotationZ": 93.5,
											"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
											"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"
										}
									]
								},
								{
									"type": "object",
									"name": "Sockets",
									"x": 2.4499999999999997,
									"y": 2.130000000000001,
									"children": [
										{
											"type": "model",
											"name": "Socket",
											"source": "Structure/Village/Tiles/Model/Socket.fbx",
											"x": 92.57,
											"y": -1061.82,
											"scaleY": 1.0000000000000002,
											"scaleZ": 1.0000000000000002,
											"rotationZ": 100
										},
										{
											"type": "model",
											"name": "Socket",
											"source": "Structure/Village/Tiles/Model/Socket.fbx",
											"x": 1.5200000000000005,
											"y": -4.900000000000001,
											"scaleY": 1.0000000000000002,
											"scaleZ": 1.0000000000000002,
											"rotationZ": 100
										},
										{
											"type": "model",
											"name": "Socket",
											"source": "Structure/Village/Tiles/Model/Socket.fbx",
											"x": 1.7000000000000002,
											"y": -1.6700000000000017,
											"scaleY": 1.0000000000000002,
											"scaleZ": 1.0000000000000002,
											"rotationZ": 100
										},
										{
											"type": "model",
											"name": "Socket",
											"source": "Structure/Village/Tiles/Model/Socket.fbx",
											"x": -0.9299999999999999,
											"y": 2.669999999999998,
											"scaleY": 1.0000000000000002,
											"scaleZ": 1.0000000000000002,
											"rotationZ": 100
										},
										{
											"type": "model",
											"name": "Socket",
											"source": "Structure/Village/Tiles/Model/Socket.fbx",
											"x": 1.5300000000000011,
											"y": 1.2099999999999986,
											"scaleY": 1.0000000000000002,
											"scaleZ": 1.0000000000000002,
											"rotationZ": 100
										}
									],
									"enabled": false
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"editorOnly": true,
							"locked": true,
							"x": -0.024,
							"y": 0.35499400000000003,
							"z": -0.7779219999999999,
							"scaleX": 4000,
							"scaleY": 4000,
							"scaleZ": 2,
							"color": -14869219,
							"kind": 0,
							"args": [
								0
							]
						}
					],
					"enabled": false
				},
				{
					"type": "model",
					"name": "Feu_1",
					"source": "Fx/Meshes_Common/Plane_50polys.fbx",
					"x": -1.05295,
					"y": 1.09484,
					"z": 1.27591,
					"scaleX": 8,
					"scaleY": 7,
					"rotationX": 60,
					"rotationZ": -90,
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
									"enableStencil": false,
									"parallax": 0,
									"emissive": 4,
									"drawOrder": "100"
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/TS_Dust_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 0.77,
										"shiftSpeedX": -0.15,
										"shiftSpeedY": 0
									},
									"recursiveApply": false,
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
										"progress": 0.47,
										"saturation": 0,
										"width": 0.32,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.08,
											0.05
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
										"progress": 0.3,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.01,
											0.01
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.4627450980392157,
											0
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
										"range": 2,
										"power": 0.5
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"onDecal": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/GradientSpice_2.png"
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "Feu_2",
					"source": "Fx/Meshes_Common/Plane_50polys.fbx",
					"x": 0.65341,
					"y": -0.7723,
					"z": 1.88991,
					"scaleX": 8,
					"scaleY": 7,
					"rotationX": 60,
					"rotationZ": -105.5,
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
									"enableStencil": false,
									"parallax": 0,
									"emissive": 4,
									"drawOrder": "110"
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/TS_Dust_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 0.77,
										"shiftSpeedX": -0.15,
										"shiftSpeedY": 0
									},
									"recursiveApply": false,
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
										"progress": 0.47,
										"saturation": 0,
										"width": 0.32,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.06,
											0.06
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
										"progress": 0.3,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.02,
											0.02
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.4627450980392157,
											0
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
										"range": 2,
										"power": 0.5
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"onDecal": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/GradientSpice_2.png"
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "Feu_3",
					"source": "Fx/Meshes_Common/Plane_50polys.fbx",
					"z": -0.33394,
					"scaleX": 9,
					"scaleY": 9,
					"rotationZ": 90,
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
									"enableStencil": false,
									"parallax": 0,
									"emissive": 10,
									"drawOrder": "100"
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/TS_Dust_02.png"
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
										"progress": 0.66,
										"saturation": 0,
										"width": 0.77,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
											0.05
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
										"progress": 0.66,
										"saturation": 0,
										"width": 0.77,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.01,
											0.01
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.4627450980392157,
											0
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
										"range": 2,
										"power": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": false,
										"Y": false,
										"Z": true,
										"tex": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 2,
										"scrollSpeed": [
											0.1,
											0
										],
										"smoothEdge": 0,
										"texScale": 1,
										"texScaleX": 1,
										"texScaleY": 1
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"enabled": false,
									"props": {
										"scaleX": 2,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0.02,
										"shiftSpeedY": 0
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Smoke",
					"source": "Fx/Meshes_Common/Plane_50polys.fbx",
					"x": 1.65029,
					"y": 0.81273,
					"z": 3.12905,
					"scaleX": 9,
					"scaleY": 11,
					"rotationX": 47.5,
					"rotationY": 1.1,
					"rotationZ": -85.1,
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
									"enableStencil": false,
									"parallax": 0,
									"emissive": 5,
									"drawOrder": "-80"
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/TS_Dust_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 0.77,
										"shiftSpeedX": -0.05,
										"shiftSpeedY": 0
									},
									"recursiveApply": false,
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
										"progress": 0.47,
										"saturation": 1,
										"width": 0.66,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.05,
											0.03
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
										"progress": 0.34,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.05,
											0.03
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.07450980392156863,
											0.07450980392156863,
											0.07450980392156863
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png"
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Smoke_2",
					"source": "Fx/Meshes_Common/Plane_50polys.fbx",
					"x": -0.47352,
					"y": 1.4221,
					"z": 2.15322,
					"scaleX": 10,
					"scaleY": 8,
					"rotationX": 60,
					"rotationZ": -85,
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
									"enableStencil": false,
									"parallax": 0,
									"emissive": 5,
									"drawOrder": "-80"
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/TS_Dust_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 0.77,
										"shiftSpeedX": -0.05,
										"shiftSpeedY": 0
									},
									"recursiveApply": false,
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
										"progress": 0.47,
										"saturation": 1,
										"width": 0.66,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.04,
											0.02
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
										"progress": 0.34,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.04,
											0.02
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.07450980392156863,
											0.07450980392156863,
											0.07450980392156863
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png"
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Smoke_3",
					"source": "Fx/Meshes_Common/Plane_50polys.fbx",
					"x": 0.11173,
					"y": -0.42556000000000005,
					"z": 3.0118000000000005,
					"scaleX": 9,
					"scaleY": 7.999999999999999,
					"rotationX": 47.399999999999984,
					"rotationY": -0.19999999999999815,
					"rotationZ": -91.1,
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
									"enableStencil": false,
									"parallax": 0,
									"emissive": 5,
									"drawOrder": "-80"
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/TS_Dust_01.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 0.77,
										"shiftSpeedX": -0.05,
										"shiftSpeedY": 0
									},
									"recursiveApply": false,
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
										"progress": 0.47,
										"saturation": 1,
										"width": 0.66,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.05,
											0.03
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
										"progress": 0.34,
										"saturation": 1,
										"width": 0.2,
										"uvScaleX": 3,
										"uvScaleY": 3,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.05,
											0.03
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 2,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.07450980392156863,
											0.07450980392156863,
											0.07450980392156863
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png"
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sparks",
					"props": {
						"lifeTime": 5,
						"lifeTimeRand": 1,
						"maxCount": 40,
						"alignMode": "Screen",
						"useRandomColor": true,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.12156862745098039,
							0.12156862745098039,
							0.12156862745098039,
							1
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
						"instAcceleration": [
							0,
							0.45,
							0.4
						],
						"instAcceleration_rand": [
							0,
							0.3,
							0.3
						],
						"instScale": 0.35,
						"instScale_rand": 0.15
					},
					"x": 0.23005,
					"y": 0.31476,
					"z": 2.01378,
					"scaleY": 6,
					"scaleZ": 2,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0,
											"emissive": 8
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/TS_Dust_02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.4627450980392157,
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
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
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
											"children": [
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														}
													]
												}
											],
											"isInstance": true
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Smoke_Ground",
					"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
					"z": 0.42068,
					"scaleX": 6,
					"scaleY": 6,
					"scaleZ": 5,
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
									"culling": "Back",
									"colorMask": 255
								}
							}
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
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/circGrad01.png",
								"onDecal": false
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
								"progress": 0.43,
								"saturation": 0,
								"width": 0.28,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-0.03
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
								"progress": 0.58,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 0.08,
								"texture": "Fx/noise/perlin06.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									-0.02
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
							"props": {
								"sandBlend": 0.49,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
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
								"range": 2,
								"power": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.16862745098039217,
									0.16862745098039217,
									0.16862745098039217
								]
							},
							"isInstance": true
						}
					]
				},
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
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 3,
									"value": 1,
									"mode": 2
								}
							]
						}
					],
					"isInstance": true
				}
			]
		}
	]
}