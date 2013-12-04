
require 'formula'

class Octomap < Formula
  url 'https://github.com/OctoMap/octomap.git', {:using => :git, :tag => 'v1.4.1'}
  homepage 'http://octomap.sourceforge.net/'
  version '1.4.1'

  depends_on 'cmake'

  def patches
    DATA
  end

  def install
    ENV.universal_binary
    system "mkdir build"
    system "cd build && cmake .. #{std_cmake_parameters}"
    system "cd build && make install"
  end

end

__END__
diff --git a/octomap/include/octomap/OccupancyOcTreeBase.hxx b/octomap/include/octomap/OccupancyOcTreeBase.hxx
index 4418cea..9c3e85e 100644
--- a/octomap/include/octomap/OccupancyOcTreeBase.hxx
+++ b/octomap/include/octomap/OccupancyOcTreeBase.hxx
@@ -363,12 +363,12 @@ namespace octomap {
       if (isNodeOccupied(startingNode)){
         // Occupied node found at origin 
         // (need to convert from key, since origin does not need to be a voxel center)
-        genCoords(current_key, this->tree_depth, end);
+        this->genCoords(current_key, this->tree_depth, end);
         return true;
       }
     } else if(!ignoreUnknown){
       OCTOMAP_ERROR_STR("Origin node at " << origin << " for raycasting not found, does the node exist?");
-      genCoords(current_key, this->tree_depth, end);
+      this->genCoords(current_key, this->tree_depth, end);
       return false;
     }
 
@@ -435,7 +435,7 @@ namespace octomap {
       {
     	  OCTOMAP_WARNING("Coordinate hit bounds in dim %d, aborting raycast\n", dim);
     	  // return border point nevertheless:
-    	  genCoords(current_key, this->tree_depth, end);
+          this->genCoords(current_key, this->tree_depth, end);
     	  return false;
       }
 
