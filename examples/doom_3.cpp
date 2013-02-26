for ( int j = 0; j < tri->numIndexes; j++ ) {
  int i = tri->indexes[j];
  if ( used[i] ) {
    continue;
  }
  used[i] = true;

  idVec3 lightDir;
  const idDrawVert *v;

  v = &tri->ambientSurface->verts[i];

  lightDir = localLightOrigin - v->xyz;

  cache[i].localLightVector[0] = lightDir * v->tangents[0];
  cache[i].localLightVector[1] = lightDir * v->tangents[1];
  cache[i].localLightVector[2] = lightDir * v->normal;
}