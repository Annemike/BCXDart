//
// Created by magnus on 15.12.17.
//

#ifndef CONE_SEQUENCER_NEARESTSAMECOLOR_H
#define CONE_SEQUENCER_NEARESTSAMECOLOR_H

#include "dart_msgs/cone_list.h"

class NearestSameColor {
public:
    bool solve(dart_msgs::cone_list &cones, dart_msgs::cone_list& left_cones, dart_msgs::cone_list& right_cones);

};


#endif //CONE_SEQUENCER_NEARESTSAMECOLOR_H
