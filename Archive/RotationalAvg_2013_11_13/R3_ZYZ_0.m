function R3 = R3_ZYZ_0(Phi,Psi,Theta)
%R3_ZYZ_0
%    R3 = R3_ZYZ_0(PHI,PSI,THETA)

%    This function was generated by the Symbolic Math Toolbox version 5.8.
%    13-Nov-2013 17:19:14

t4 = cos(Psi);
t5 = sin(Phi);
t6 = cos(Phi);
t7 = cos(Theta);
t8 = sin(Psi);
t9 = t5.*t8;
t10 = t4.*t6.*t7;
t2 = t9-t10;
t3 = t2.^2;
t11 = t4.*t5;
t12 = t6.*t7.*t8;
t13 = t11+t12;
t14 = t3.*t13;
t15 = sin(Theta);
t16 = t3.*t6.*t15;
t17 = t13.^2;
t18 = t6.*t15.*t17;
t19 = t6.^2;
t20 = t15.^2;
t21 = t13.*t19.*t20;
t22 = t6.*t8;
t23 = t4.*t5.*t7;
t24 = t22+t23;
t25 = t4.*t6;
t27 = t5.*t7.*t8;
t26 = t25-t27;
t28 = t2.*t13.*t24;
t29 = t2.*t5.*t13.*t15;
t30 = t2.*t6.*t15.*t24;
t31 = t2.*t5.*t6.*t20;
t32 = t6.*t13.*t15.*t26;
t33 = t2.*t4.*t13.*t15;
t34 = t2.*t8.*t13.*t15;
t35 = t2.*t4.*t6.*t20;
t36 = t2.*t6.*t8.*t20;
t37 = t6.*t7.*t13.*t15;
t38 = t3.*t26;
t39 = t17.*t26;
t40 = t19.*t20.*t26;
t41 = t2.*t24.*t26;
t42 = t2.*t5.*t15.*t26;
t43 = t24.^2;
t44 = t26.^2;
t45 = t5.*t13.*t15.*t24;
t46 = t5.^2;
t47 = t5.*t6.*t20.*t24;
t48 = t3.*t7;
t49 = t7.*t17;
t50 = t7.*t19.*t20;
t51 = t2.*t4.*t15.*t26;
t52 = t2.*t8.*t15.*t26;
t53 = t2.*t7.*t24;
t54 = t2.*t5.*t7.*t15;
t55 = t4.*t13.*t15.*t24;
t56 = t4.*t5.*t13.*t20;
t57 = t8.*t13.*t15.*t24;
t58 = t5.*t8.*t13.*t20;
t59 = t7.*t13.*t26;
t60 = t4.*t6.*t20.*t24;
t61 = t4.*t5.*t6.*t15.*t20;
t62 = t6.*t8.*t20.*t24;
t63 = t5.*t6.*t8.*t15.*t20;
t64 = t6.*t7.*t15.*t26;
t65 = t2.*t4.*t7.*t15;
t66 = t2.*t7.*t8.*t15;
t67 = t4.^2;
t68 = t4.*t8.*t13.*t20;
t69 = t8.^2;
t70 = t7.^2;
t71 = t4.*t6.*t8.*t15.*t20;
t72 = t13.*t43;
t73 = t6.*t15.*t43;
t74 = t13.*t44;
t75 = t6.*t15.*t44;
t76 = t13.*t20.*t46;
t77 = t6.*t15.*t20.*t46;
t78 = t26.*t43;
t79 = t5.*t15.*t24.*t26;
t80 = t20.*t26.*t46;
t81 = t4.*t15.*t24.*t26;
t82 = t8.*t15.*t24.*t26;
t83 = t5.*t7.*t15.*t24;
t84 = t4.*t5.*t20.*t26;
t85 = t5.*t8.*t20.*t26;
t86 = t7.*t43;
t87 = t7.*t44;
t88 = t7.*t20.*t46;
t89 = t4.*t7.*t15.*t24;
t90 = t7.*t8.*t15.*t24;
t91 = t4.*t8.*t20.*t26;
t92 = t4.*t5.*t7.*t20;
t93 = t5.*t7.*t8.*t20;
t94 = t13.*t20.*t67;
t95 = t6.*t15.*t20.*t67;
t96 = t13.*t20.*t69;
t97 = t6.*t15.*t20.*t69;
t98 = t13.*t70;
t99 = t6.*t15.*t70;
t100 = t20.*t26.*t67;
t101 = t20.*t26.*t69;
t102 = t26.*t70;
t103 = t7.*t20.*t67;
t104 = t4.*t7.*t8.*t20;
t105 = t7.*t20.*t69;
R3 = reshape([-t2.*t3,-t3.*t24,-t3.*t4.*t15,-t3.*t24,-t2.*t43,-t2.*t4.*t15.*t24,-t3.*t4.*t15,-t2.*t4.*t15.*t24,-t2.*t20.*t67,-t3.*t24,-t2.*t43,-t2.*t4.*t15.*t24,-t2.*t43,-t24.*t43,-t4.*t15.*t43,-t2.*t4.*t15.*t24,-t4.*t15.*t43,-t20.*t24.*t67,-t3.*t4.*t15,-t2.*t4.*t15.*t24,-t2.*t20.*t67,-t2.*t4.*t15.*t24,-t4.*t15.*t43,-t20.*t24.*t67,-t2.*t20.*t67,-t20.*t24.*t67,-t4.*t15.*t20.*t67,t14,t38,-t3.*t8.*t15,t28,t41,-t2.*t8.*t15.*t24,t33,t51,-t2.*t4.*t8.*t20,t28,t41,-t2.*t8.*t15.*t24,t72,t78,-t8.*t15.*t43,t55,t81,-t4.*t8.*t20.*t24,t33,t51,-t2.*t4.*t8.*t20,t55,t81,-t4.*t8.*t20.*t24,t94,t100,-t8.*t15.*t20.*t67,t16,-t3.*t5.*t15,t48,t30,-t2.*t5.*t15.*t24,t53,t35,-t2.*t4.*t5.*t20,t65,t30,-t2.*t5.*t15.*t24,t53,t73,-t5.*t15.*t43,t86,t60,-t4.*t5.*t20.*t24,t89,t35,-t2.*t4.*t5.*t20,t65,t60,-t4.*t5.*t20.*t24,t89,t95,-t5.*t15.*t20.*t67,t103,t14,t28,t33,t38,t41,t51,-t3.*t8.*t15,-t2.*t8.*t15.*t24,-t2.*t4.*t8.*t20,t28,t72,t55,t41,t78,t81,-t2.*t8.*t15.*t24,-t8.*t15.*t43,-t4.*t8.*t20.*t24,t33,t55,t94,t51,t81,t100,-t2.*t4.*t8.*t20,-t4.*t8.*t20.*t24,-t8.*t15.*t20.*t67,-t2.*t17,-t2.*t13.*t26,t34,-t2.*t13.*t26,-t2.*t44,t52,t34,t52,-t2.*t20.*t69,-t17.*t24,-t13.*t24.*t26,t57,-t13.*t24.*t26,-t24.*t44,t82,t57,t82,-t20.*t24.*t69,-t4.*t15.*t17,-t4.*t13.*t15.*t26,t68,-t4.*t13.*t15.*t26,-t4.*t15.*t44,t91,t68,t91,-t4.*t15.*t20.*t69,-t2.*t6.*t13.*t15,t29,-t2.*t7.*t13,-t2.*t6.*t15.*t26,t42,-t2.*t7.*t26,t36,-t2.*t5.*t8.*t20,t66,-t6.*t13.*t15.*t24,t45,-t7.*t13.*t24,-t6.*t15.*t24.*t26,t79,-t7.*t24.*t26,t62,-t5.*t8.*t20.*t24,t90,-t4.*t6.*t13.*t20,t56,-t4.*t7.*t13.*t15,-t4.*t6.*t20.*t26,t84,-t4.*t7.*t15.*t26,t71,-t4.*t5.*t8.*t15.*t20,t104,t16,t30,t35,-t3.*t5.*t15,-t2.*t5.*t15.*t24,-t2.*t4.*t5.*t20,t48,t53,t65,t30,t73,t60,-t2.*t5.*t15.*t24,-t5.*t15.*t43,-t4.*t5.*t20.*t24,t53,t86,t89,t35,t60,t95,-t2.*t4.*t5.*t20,-t4.*t5.*t20.*t24,-t5.*t15.*t20.*t67,t65,t89,t103,-t2.*t6.*t13.*t15,-t2.*t6.*t15.*t26,t36,t29,t42,-t2.*t5.*t8.*t20,-t2.*t7.*t13,-t2.*t7.*t26,t66,-t6.*t13.*t15.*t24,-t6.*t15.*t24.*t26,t62,t45,t79,-t5.*t8.*t20.*t24,-t7.*t13.*t24,-t7.*t24.*t26,t90,-t4.*t6.*t13.*t20,-t4.*t6.*t20.*t26,t71,t56,t84,-t4.*t5.*t8.*t15.*t20,-t4.*t7.*t13.*t15,-t4.*t7.*t15.*t26,t104,-t2.*t19.*t20,t31,-t2.*t6.*t7.*t15,t31,-t2.*t20.*t46,t54,-t2.*t6.*t7.*t15,t54,-t2.*t70,-t19.*t20.*t24,t47,-t6.*t7.*t15.*t24,t47,-t20.*t24.*t46,t83,-t6.*t7.*t15.*t24,t83,-t24.*t70,-t4.*t15.*t19.*t20,t61,-t4.*t6.*t7.*t20,t61,-t4.*t15.*t20.*t46,t92,-t4.*t6.*t7.*t20,t92,-t4.*t15.*t70,t14,t28,t33,t28,t72,t55,t33,t55,t94,t38,t41,t51,t41,t78,t81,t51,t81,t100,-t3.*t8.*t15,-t2.*t8.*t15.*t24,-t2.*t4.*t8.*t20,-t2.*t8.*t15.*t24,-t8.*t15.*t43,-t4.*t8.*t20.*t24,-t2.*t4.*t8.*t20,-t4.*t8.*t20.*t24,-t8.*t15.*t20.*t67,-t2.*t17,-t2.*t13.*t26,t34,-t17.*t24,-t13.*t24.*t26,t57,-t4.*t15.*t17,-t4.*t13.*t15.*t26,t68,-t2.*t13.*t26,-t2.*t44,t52,-t13.*t24.*t26,-t24.*t44,t82,-t4.*t13.*t15.*t26,-t4.*t15.*t44,t91,t34,t52,-t2.*t20.*t69,t57,t82,-t20.*t24.*t69,t68,t91,-t4.*t15.*t20.*t69,-t2.*t6.*t13.*t15,t29,-t2.*t7.*t13,-t6.*t13.*t15.*t24,t45,-t7.*t13.*t24,-t4.*t6.*t13.*t20,t56,-t4.*t7.*t13.*t15,-t2.*t6.*t15.*t26,t42,-t2.*t7.*t26,-t6.*t15.*t24.*t26,t79,-t7.*t24.*t26,-t4.*t6.*t20.*t26,t84,-t4.*t7.*t15.*t26,t36,-t2.*t5.*t8.*t20,t66,t62,-t5.*t8.*t20.*t24,t90,t71,-t4.*t5.*t8.*t15.*t20,t104,-t2.*t17,-t17.*t24,-t4.*t15.*t17,-t2.*t13.*t26,-t13.*t24.*t26,-t4.*t13.*t15.*t26,t34,t57,t68,-t2.*t13.*t26,-t13.*t24.*t26,-t4.*t13.*t15.*t26,-t2.*t44,-t24.*t44,-t4.*t15.*t44,t52,t82,t91,t34,t57,t68,t52,t82,t91,-t2.*t20.*t69,-t20.*t24.*t69,-t4.*t15.*t20.*t69,t13.*t17,t39,-t8.*t15.*t17,t39,t74,-t8.*t13.*t15.*t26,-t8.*t15.*t17,-t8.*t13.*t15.*t26,t96,t39,t74,-t8.*t13.*t15.*t26,t74,t26.*t44,-t8.*t15.*t44,-t8.*t13.*t15.*t26,-t8.*t15.*t44,t101,-t8.*t15.*t17,-t8.*t13.*t15.*t26,t96,-t8.*t13.*t15.*t26,-t8.*t15.*t44,t101,t96,t101,-t8.*t15.*t20.*t69,t18,-t5.*t15.*t17,t49,t32,-t5.*t13.*t15.*t26,t59,-t6.*t8.*t13.*t20,t58,-t7.*t8.*t13.*t15,t32,-t5.*t13.*t15.*t26,t59,t75,-t5.*t15.*t44,t87,-t6.*t8.*t20.*t26,t85,-t7.*t8.*t15.*t26,-t6.*t8.*t13.*t20,t58,-t7.*t8.*t13.*t15,-t6.*t8.*t20.*t26,t85,-t7.*t8.*t15.*t26,t97,-t5.*t15.*t20.*t69,t105,-t2.*t6.*t13.*t15,-t6.*t13.*t15.*t24,-t4.*t6.*t13.*t20,t29,t45,t56,-t2.*t7.*t13,-t7.*t13.*t24,-t4.*t7.*t13.*t15,-t2.*t6.*t15.*t26,-t6.*t15.*t24.*t26,-t4.*t6.*t20.*t26,t42,t79,t84,-t2.*t7.*t26,-t7.*t24.*t26,-t4.*t7.*t15.*t26,t36,t62,t71,-t2.*t5.*t8.*t20,-t5.*t8.*t20.*t24,-t4.*t5.*t8.*t15.*t20,t66,t90,t104,t18,t32,-t6.*t8.*t13.*t20,-t5.*t15.*t17,-t5.*t13.*t15.*t26,t58,t49,t59,-t7.*t8.*t13.*t15,t32,t75,-t6.*t8.*t20.*t26,-t5.*t13.*t15.*t26,-t5.*t15.*t44,t85,t59,t87,-t7.*t8.*t15.*t26,-t6.*t8.*t13.*t20,-t6.*t8.*t20.*t26,t97,t58,t85,-t5.*t15.*t20.*t69,-t7.*t8.*t13.*t15,-t7.*t8.*t15.*t26,t105,t21,-t5.*t6.*t13.*t20,t37,-t5.*t6.*t13.*t20,t76,-t5.*t7.*t13.*t15,t37,-t5.*t7.*t13.*t15,t98,t40,-t5.*t6.*t20.*t26,t64,-t5.*t6.*t20.*t26,t80,-t5.*t7.*t15.*t26,t64,-t5.*t7.*t15.*t26,t102,-t8.*t15.*t19.*t20,t63,-t6.*t7.*t8.*t20,t63,-t8.*t15.*t20.*t46,t93,-t6.*t7.*t8.*t20,t93,-t8.*t15.*t70,t16,t30,t35,t30,t73,t60,t35,t60,t95,-t3.*t5.*t15,-t2.*t5.*t15.*t24,-t2.*t4.*t5.*t20,-t2.*t5.*t15.*t24,-t5.*t15.*t43,-t4.*t5.*t20.*t24,-t2.*t4.*t5.*t20,-t4.*t5.*t20.*t24,-t5.*t15.*t20.*t67,t48,t53,t65,t53,t86,t89,t65,t89,t103,-t2.*t6.*t13.*t15,-t2.*t6.*t15.*t26,t36,-t6.*t13.*t15.*t24,-t6.*t15.*t24.*t26,t62,-t4.*t6.*t13.*t20,-t4.*t6.*t20.*t26,t71,t29,t42,-t2.*t5.*t8.*t20,t45,t79,-t5.*t8.*t20.*t24,t56,t84,-t4.*t5.*t8.*t15.*t20,-t2.*t7.*t13,-t2.*t7.*t26,t66,-t7.*t13.*t24,-t7.*t24.*t26,t90,-t4.*t7.*t13.*t15,-t4.*t7.*t15.*t26,t104,-t2.*t19.*t20,t31,-t2.*t6.*t7.*t15,-t19.*t20.*t24,t47,-t6.*t7.*t15.*t24,-t4.*t15.*t19.*t20,t61,-t4.*t6.*t7.*t20,t31,-t2.*t20.*t46,t54,t47,-t20.*t24.*t46,t83,t61,-t4.*t15.*t20.*t46,t92,-t2.*t6.*t7.*t15,t54,-t2.*t70,-t6.*t7.*t15.*t24,t83,-t24.*t70,-t4.*t6.*t7.*t20,t92,-t4.*t15.*t70,-t2.*t6.*t13.*t15,-t6.*t13.*t15.*t24,-t4.*t6.*t13.*t20,-t2.*t6.*t15.*t26,-t6.*t15.*t24.*t26,-t4.*t6.*t20.*t26,t36,t62,t71,t29,t45,t56,t42,t79,t84,-t2.*t5.*t8.*t20,-t5.*t8.*t20.*t24,-t4.*t5.*t8.*t15.*t20,-t2.*t7.*t13,-t7.*t13.*t24,-t4.*t7.*t13.*t15,-t2.*t7.*t26,-t7.*t24.*t26,-t4.*t7.*t15.*t26,t66,t90,t104,t18,t32,-t6.*t8.*t13.*t20,t32,t75,-t6.*t8.*t20.*t26,-t6.*t8.*t13.*t20,-t6.*t8.*t20.*t26,t97,-t5.*t15.*t17,-t5.*t13.*t15.*t26,t58,-t5.*t13.*t15.*t26,-t5.*t15.*t44,t85,t58,t85,-t5.*t15.*t20.*t69,t49,t59,-t7.*t8.*t13.*t15,t59,t87,-t7.*t8.*t15.*t26,-t7.*t8.*t13.*t15,-t7.*t8.*t15.*t26,t105,t21,-t5.*t6.*t13.*t20,t37,t40,-t5.*t6.*t20.*t26,t64,-t8.*t15.*t19.*t20,t63,-t6.*t7.*t8.*t20,-t5.*t6.*t13.*t20,t76,-t5.*t7.*t13.*t15,-t5.*t6.*t20.*t26,t80,-t5.*t7.*t15.*t26,t63,-t8.*t15.*t20.*t46,t93,t37,-t5.*t7.*t13.*t15,t98,t64,-t5.*t7.*t15.*t26,t102,-t6.*t7.*t8.*t20,t93,-t8.*t15.*t70,-t2.*t19.*t20,-t19.*t20.*t24,-t4.*t15.*t19.*t20,t31,t47,t61,-t2.*t6.*t7.*t15,-t6.*t7.*t15.*t24,-t4.*t6.*t7.*t20,t31,t47,t61,-t2.*t20.*t46,-t20.*t24.*t46,-t4.*t15.*t20.*t46,t54,t83,t92,-t2.*t6.*t7.*t15,-t6.*t7.*t15.*t24,-t4.*t6.*t7.*t20,t54,t83,t92,-t2.*t70,-t24.*t70,-t4.*t15.*t70,t21,t40,-t8.*t15.*t19.*t20,-t5.*t6.*t13.*t20,-t5.*t6.*t20.*t26,t63,t37,t64,-t6.*t7.*t8.*t20,-t5.*t6.*t13.*t20,-t5.*t6.*t20.*t26,t63,t76,t80,-t8.*t15.*t20.*t46,-t5.*t7.*t13.*t15,-t5.*t7.*t15.*t26,t93,t37,t64,-t6.*t7.*t8.*t20,-t5.*t7.*t13.*t15,-t5.*t7.*t15.*t26,t93,t98,t102,-t8.*t15.*t70,t6.*t15.*t19.*t20,-t5.*t15.*t19.*t20,t50,-t5.*t15.*t19.*t20,t77,-t5.*t6.*t7.*t20,t50,-t5.*t6.*t7.*t20,t99,-t5.*t15.*t19.*t20,t77,-t5.*t6.*t7.*t20,t77,-t5.*t15.*t20.*t46,t88,-t5.*t6.*t7.*t20,t88,-t5.*t15.*t70,t50,-t5.*t6.*t7.*t20,t99,-t5.*t6.*t7.*t20,t88,-t5.*t15.*t70,t99,-t5.*t15.*t70,t7.*t70],[27, 27]);