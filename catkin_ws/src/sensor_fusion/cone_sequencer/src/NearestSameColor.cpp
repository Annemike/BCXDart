//
// Created by magnus on 15.12.17.
//

#include "NearestSameColor.h"
#include "dart_msgs/cone_list.h"
#include <deque>
double coneSqDist(dart_msgs::cone& cone1, dart_msgs::cone& cone2){
    double dx = cone1.position.x - cone2.position.x;
    double dy = cone1.position.y - cone2.position.y;
    return dx*dx+dy*dy;
}


bool NearestSameColor::solve(dart_msgs::cone_list &cones, dart_msgs::cone_list& left_cones, dart_msgs::cone_list& right_cones) {
    std::deque<dart_msgs::cone> colorSortedCones[4];
    for(auto& cone: cones.cones){
        colorSortedCones[cone.type].push_back(cone);
    }//now colorSortedCones

    dart_msgs::cone lastCone;
    lastCone.position.x =0;
    lastCone.position.y =0;

    dart_msgs::cone bestCone;

    while(1){//sort all left cones
        if(colorSortedCones[0].size()==0){
            break;
        }
        double minDist = std::numeric_limits<double>::infinity();
        auto indexNearest=colorSortedCones[0].begin();


        for(auto it=colorSortedCones[0].begin();it<colorSortedCones[0].end();it++){
            double dist = coneSqDist(lastCone, *it);
            if(dist<minDist){
                minDist = dist;
                indexNearest = it;
                bestCone = *it;
            }

        }
        if(minDist>10*10){
            break;
        }
        left_cones.cones.push_back(bestCone);
        lastCone = bestCone;
        colorSortedCones[0].erase(indexNearest);

    }


    lastCone.position.x =0;
    lastCone.position.y =0;

    while(1){//sort all left cones
        if(colorSortedCones[1].size()==0){
            break;
        }
        double minDist = std::numeric_limits<double>::infinity();
        auto indexNearest=colorSortedCones[1].begin();


        for(auto it=colorSortedCones[1].begin();it<colorSortedCones[1].end();it++){
            double dist = coneSqDist(lastCone, *it);
            if(dist<minDist){
                minDist = dist;
                indexNearest = it;
                bestCone = *it;
            }

        }

        if(minDist>10*10){
            break;
        }
        right_cones.cones.push_back(bestCone);
        lastCone = bestCone;
        colorSortedCones[1].erase(indexNearest);
    }

}