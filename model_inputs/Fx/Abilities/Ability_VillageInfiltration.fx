{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"z": 0.02,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "Village",
					"enabled": false,
					"editorOnly": true,
					"x": 0.024,
					"y": -0.193174,
					"z": 0.808072,
					"children": [
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
									"enabled": false,
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
									]
								},
								{
									"type": "object",
									"name": "Revolt_02",
									"enabled": false,
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
									]
								},
								{
									"type": "object",
									"name": "Pillaged_01",
									"enabled": false,
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
									]
								},
								{
									"type": "object",
									"name": "Pillaged_02",
									"enabled": false,
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
									]
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
									"enabled": false,
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
									]
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
									"enabled": false,
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
									]
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
					]
				},
				{
					"type": "model",
					"name": "Spiral",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"enabled": false,
					"z": 0.65291,
					"scaleX": 27,
					"scaleY": 27,
					"scaleZ": 10,
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
									"enableStencil": false
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png"
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
								"alpha": 1.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/vGrad_inv.jpg",
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
								"progress": 0.39,
								"saturation": 0,
								"width": 0.76,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/causticTexture_03-2.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.03,
									0.07
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
					"type": "model",
					"name": "Flag",
					"source": "Fx/Meshes_Common/CurvedPlan.fbx",
					"enabled": false,
					"z": 6.4909,
					"scaleX": 1.67,
					"scaleY": 2.95,
					"scaleZ": 0.87,
					"rotationY": 90,
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
									"enableStencil": false
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png"
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
								"alpha": 1.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/z_FillWhite.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": false,
								"Z": false,
								"texScaleX": 1,
								"texScaleY": 1,
								"tex": "Fx/Alphas/T_NukeVertex.png",
								"intensity": 3,
								"scrollSpeed": [
									0,
									0.1
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
									0.8313725490196078,
									0.8313725490196078,
									0.8313725490196078
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}