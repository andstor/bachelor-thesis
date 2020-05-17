// Import via ES6 modules
import * as THREE from 'three';
import { Sampler, XMLExporter } from 'voxelizer';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';

// Load 3D model.
const gltfloader = new GLTFLoader();
gltfloader.load('path/to/file.glb', function (data) {
  let mesh = data.scene;

  // Setup Voxelizer.
  let options = {
    fill: false,
    color: true
  };
  const sampler = new Sampler('raycast', options);

  // Voxelize 3D model.
  const resolution = 10;
  let volume = sampler.sample(mesh, resolution);

  // Export result to XML.
  const exporter = new XMLExporter()
  exporter.parse(volume, function (xml) {
    console.log(xml)
  });


  // Do something with the data.
  // ...
});